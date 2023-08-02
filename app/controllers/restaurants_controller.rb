class RestaurantsController < ApplicationController
  before_action :set_product, only: [:destroy, :edit, :show, :update]
  # load_and_authorize_resource
 
  def index
    @restaurants = Restaurant.all.paginate(page: params[:page], :per_page =>10)
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
     redirect_to @restaurant, notice: "Restaurant created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(params_restaurant)
      redirect_to @restaurant, notice: "Restaurant updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurant_url
  end
 
  private

  def params_restaurant
    params.require(:restaurant).permit(:name, :description, :address)
  end

  def set_product
    @restaurant = Restaurant.find(params[:id])
  end
end
