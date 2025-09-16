class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Current.user.current_cart
    @cart_items = @cart.cart_items.includes(:book)
  end

end
