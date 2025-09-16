class Book < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many_attached :images
  
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :isbn, presence: true, uniqueness: true
  validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  scope :available, -> { where('stock_quantity > 0') }
  scope :by_category, ->(category) { where(category: category) if category.present? }
  
  def available?
    stock_quantity > 0
  end
  
  def out_of_stock?
    stock_quantity <= 0
  end
end
