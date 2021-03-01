class PlacesController < ApplicationController
  def index
    @places = Place.order('created_at DESC')
  end

  def new
    @place = Place.new
  end

  def create
  @place = Place.new(place_params)
  binding.pry
  if @place.save
    flash[:success] = "Place Added!"
    redirect_to root_path
  else
    render 'new'
  end
  end
  def show 
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:title,:address,:visited_by)
  end

end





