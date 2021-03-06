class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end
  def new
    @restaurant = Restaurant.new
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
      if @restaurant.save
        redirect_to restaurants_path
      else
        render 'new'
      end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params[:restaurant].permit(:name, :address, :image, :rate, :remove_image, :image_cache)
  end
end
