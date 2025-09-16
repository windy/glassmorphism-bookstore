class Order < ApplicationRecord
  validates :customer_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :customer_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :product_name, presence: true, length: { minimum: 2, maximum: 200 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending processing paid failed canceled] }

  # Scopes
  scope :pending, -> { where(status: 'pending') }
  scope :processing, -> { where(status: 'processing') }
  scope :paid, -> { where(status: 'paid') }
  scope :failed, -> { where(status: 'failed') }
  scope :canceled, -> { where(status: 'canceled') }
  scope :recent, -> { order(created_at: :desc) }

  # Status methods
  def pending?
    status == 'pending'
  end

  def processing?
    status == 'processing'
  end

  def paid?
    status == 'paid'
  end

  def failed?
    status == 'failed'
  end

  def canceled?
    status == 'canceled'
  end

  def completed?
    paid?
  end

  # Status transitions
  def mark_as_processing!
    update!(status: 'processing')
  end

  def mark_as_paid!
    update!(status: 'paid')
  end

  def mark_as_failed!
    update!(status: 'failed')
  end

  def mark_as_canceled!
    update!(status: 'canceled')
  end

  # Amount helpers
  def amount_in_cents
    (amount * 100).to_i
  end

  def formatted_amount
    "#{currency.upcase} #{sprintf('%.2f', amount)}"
  end

  def display_status
    status.humanize
  end

  # Stripe-related methods
  def has_stripe_payment_intent?
    stripe_payment_intent_id.present?
  end

  def stripe_payment_url
    return nil unless has_stripe_payment_intent?
    # This would be the Stripe checkout URL or payment intent client_secret
    stripe_payment_intent_id
  end

  # Order summary for display
  def summary
    "#{product_name} for #{customer_name} (#{formatted_amount})"
  end

  # Search functionality for admin
  scope :search, ->(query) {
    return all if query.blank?

    where(
      "customer_name ILIKE :query OR customer_email ILIKE :query OR product_name ILIKE :query OR status ILIKE :query",
      query: "%#{query}%"
    )
  }

  # Default ordering
  default_scope { order(created_at: :desc) }
end
