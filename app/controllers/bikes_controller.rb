class BikesController < ApplicationController
  before_action :find_user, only: [ :new, :create, :show ]

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


  private

  def bike_params
    params.require(:review).permit(:address, :kind, :helmet, :picture, :zip, :city, :baby_seat)
  end
  def find_user
    @user = User.find(params[:user_id])
  end
end
