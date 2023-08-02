class CartsController < ApplicationController
  
  def show
    @cart_items = current_user.cart.cartitems
    if @cart_items.exists?
      @restaurant_id = @cart_items.first.fooditem.restaurant_id
    else
      notice = "not fooditems added"
    end  
  end
end

