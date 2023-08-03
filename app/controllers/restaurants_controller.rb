class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:destroy, :edit, :show, :update]

  def index
    if params[:q].present?
      @restaurants = Restaurant.where("name LIKE ? OR description LIKE ? OR address LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
                              .paginate(page: params[:page], per_page: 10)
    else
      @restaurants = Restaurant.all.paginate(page: params[:page], per_page: 10)
    end
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
    redirect_to restaurants_url
  end

  private

  def params_restaurant
    params.require(:restaurant).permit(:name, :description, :address)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
