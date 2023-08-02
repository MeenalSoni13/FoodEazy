class OrdersController < ApplicationController
  
  def index 
  @orders = current_user.orders
  @cartitems = current_user.cart.cartitems

  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.total_price = Fooditem.where(id: params[:order][:fooditem_ids]).pluck(:price).sum
    if @order.save
      UserMailer.send_email(current_user.email, @order).deliver_now
      flash[:success] = "Thank you for your order"
      redirect_to @order
    else
      flash.now[:error] = "Some errors occurred"
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to order_url
  end

  private

  def order_params
    params.require(:order).permit(:status, :address, :user_id, :restaurant_id, fooditem_ids: [])
  end

  def find_order
    @order = Order.find(params[:id])
  end
end