class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:destroy]
  
  def create
    @book = Book.find(params[:cart_item][:book_id])
    @cart = Current.user.current_cart
    
    quantity = params[:cart_item][:quantity].to_i
    
    if @cart.add_book(@book, quantity)
      redirect_to cart_path, notice: '商品已添加到购物车'
    else
      redirect_to book_path(@book), alert: '添加失败，请检查库存'
    end
  end
  
  def destroy
    @cart_item.destroy
    redirect_to cart_path, notice: '商品已从购物车中移除'
  end

  private
  
  def set_cart_item
    @cart_item = Current.user.current_cart.cart_items.find(params[:id])
  end
end
