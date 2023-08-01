class OrdersController < ApplicationController
  before_action :find_order, only: [:show]

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
      
      # @order.update(status: :Pending)
      flash[:success] = "Thank you for your order"
      redirect_to @order
    else
      flash.now[:error] = "Some errors occurred"
      render :new
    end
  end

  def show
     @status = @order.status
  end

  # def confirmed
  #   @order = Order.find(params[:order_id])
  #   @order.update(status: :Confirmed)
  #   lash[:success] = "your order has been Confirmed"
  #   redirect_to request.referrer
  # end

  # def rejected
  #   @order.update(status: :Rejected)
  #   flash[:success] = "Your order has been Rejected"
  #   redirect_to request.referrer
  # end

  def destroy
    @order = current_order
    @order_item = @order.cart_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
    redirect_to cart_items_path, notice: 'Order item was successfully remove.'
  end

  private

  def order_params
    params.require(:order).permit(:status, :address, :user_id, :restaurant_id, fooditem_ids: [])
  end

  def find_order
    @order = Order.find(params[:id])
  end
end