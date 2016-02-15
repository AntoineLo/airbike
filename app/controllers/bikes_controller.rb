class BikesController < ApplicationController
  before_action :find_user, only: [ :new, :create, :show ]

  def new
    @bike = Bike.new
  end


  private

  def bikes_params
    params.require(:review).permit(:address, :type, :helmet, :picture, :zip, :city, :baby_seat)
  end
  def find_user
    @user = User.find(params[:user_id])
  end
end
