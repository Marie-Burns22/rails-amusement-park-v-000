class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]  #add :destroy if that method is created
  before_action :logged_in?, only: [:new, :create, :index, :show, :edit, :update]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end


  def show
    @user = current_user
  end

  def index
    @attractions = Attraction.all
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end


  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
