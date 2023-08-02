class RestaurantsController < ApplicationController
 before_action :authenticate_user!,only: [:edit,:update,:destroy]
 load_and_authorize_resource
 
  def index
    @restaurants = Restaurant.all.paginate(page: params[:page], :per_page =>5)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
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
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(params[:id])
    if @restaurant.update(params_restaurant)
      redirect_to @restaurant, notice: "Restaurant updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurant_url
  end
 
  private

  def params_restaurant
    params.require(:restaurant).permit(:name, :description, :address)
  end
end
