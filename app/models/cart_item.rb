class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book
  
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validate :book_availability
  
  def subtotal
    book.price * quantity
  end
  
  private
  
  def book_availability
    return unless book
    
    if quantity > book.stock_quantity
      errors.add(:quantity, "exceeds available stock (#{book.stock_quantity} available)")
    end
  end
end
