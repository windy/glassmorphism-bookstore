class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items
  
  def total_price
    cart_items.sum { |item| item.book.price * item.quantity }
  end
  
  def total_items
    cart_items.sum(:quantity)
  end
  
  def add_book(book, quantity = 1)
    current_item = cart_items.find_by(book: book)
    if current_item
      current_item.update(quantity: current_item.quantity + quantity)
    else
      cart_items.create(book: book, quantity: quantity)
    end
  end
  
  def remove_book(book)
    cart_items.find_by(book: book)&.destroy
  end
  
  def clear
    cart_items.destroy_all
  end
end
