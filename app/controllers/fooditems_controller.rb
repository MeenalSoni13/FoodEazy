class FooditemsController < ApplicationController
  before_action :set_restaurant
  before_action :set_fooditem, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    if params[:q].present?
      @fooditems = @restaurant.fooditems.where("name LIKE ?", "%#{params[:q]}%")
    else
      @fooditems = @restaurant.fooditems
    end
    @fooditems = @fooditems.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @fooditem = @restaurant.fooditems.new
  end

  def create
    @fooditem = @restaurant.fooditems.new(fooditem_params)
    if @fooditem.save
      redirect_to restaurant_fooditems_path(@restaurant), notice: 'Fooditem was successfully created.'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @fooditem.update(fooditem_params)
      redirect_to restaurant_fooditems_path(@restaurant), notice: 'Fooditem was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @fooditem.destroy
    redirect_to restaurant_fooditems_path(@restaurant), notice: 'Fooditem was successfully destroyed.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_fooditem
    @fooditem = @restaurant.fooditems.find(params[:id])
  end

  def fooditem_params
    params.require(:fooditem).permit(:name, :description, :price)
  end
end