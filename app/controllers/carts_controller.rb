class CartsController < ApplicationController
  def show
    @cart_items = current_user.cart.cartitems
    @restaurant_id = @cart_items.first.fooditem.restaurant_id
  end
end

