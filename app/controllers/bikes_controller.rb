class BikesController < ApplicationController
  before_action :find_user, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:index, :new]

  def index
    @location = params[:location]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = @user.bikes.new(bike_params)
    if @bike.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    if @bike.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to :back
  end


  private

  def bike_params
    params.require(:bike).permit(:address, :kind, :helmet, :picture, :zip, :description, :city, :baby_seat, photos: [])
  end
  def find_user
    @user = User.find(params[:user_id])
  end
end
