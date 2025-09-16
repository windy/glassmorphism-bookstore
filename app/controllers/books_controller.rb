class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  
  def index
    @books = Book.available.page(params[:page]).per(12)
    @books = @books.by_category(params[:category]) if params[:category].present?
    @categories = Book.distinct.pluck(:category).compact.sort
    
    if params[:search].present?
      @books = @books.where("title ILIKE ? OR author ILIKE ?", 
                           "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  def show
    @cart_item = CartItem.new
  end

  private
  
  def set_book
    @book = Book.find(params[:id])
  end
end
