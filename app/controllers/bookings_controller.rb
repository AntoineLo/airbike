class BookingsController < ApplicationController
  # before_action :set_user, only: [:new, :create]
  # before_action :set_bike, only: [:new, :create]


  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @booking = @user.booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to :back
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :bike_id)
  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  # def set_bike
  #   @bike = Bike.find(params[:id])
  # end
end
