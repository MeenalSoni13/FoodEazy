class CartitemsController < ApplicationController
  before_action :set_cartitem, only: [:edit, :update, :destroy]

  def new; end

  def show; end

  def create
    @cartitem = Cartitem.find_or_initialize_by(cart: current_user.cart, fooditem_id: params[:fooditem_id])
    @cartitem.quantity = @cartitem.quantity.to_i + 1
    if @cartitem.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def update
    if params[:context] == "add"
      @cartitem.update(quantity: @cartitem.quantity + 1)
    elsif params[:context] == "delete" && @cartitem.quantity > 1
      quantity = @cartitem.quantity - 1
      @cartitem.update(quantity: quantity)
    end
    redirect_to request.referrer
  end

  def edit
  end

  def destroy
    #@cartitem = Cartitem.find_by(fooditem_id: params[:fooditem_id])
    @cartitem = Cartitem.find(params[:id])
    @cartitem.destroy
    redirect_to request.referrer
  end

  def remove
  end

  private

  def set_cartitem
    @cartitem = Cartitem.find_by(id: params[:id])
  end
end
