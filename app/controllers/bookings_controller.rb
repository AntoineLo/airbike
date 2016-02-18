class BookingsController < ApplicationController
  # before_action :set_user, only: [:new, :create]
  # before_action :set_bike, only: [:new, :create]


  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = @bike
    if !date_check
      @booking.save
      flash[:notice] = "Booking successfully created"
      redirect_to user_path(current_user)
    else
      render "bikes/show"
      flash[:alert] = "Date not matching ! Please try again"
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

  def date_check
    (@booking.date_in < @bike.date_in) || (@booking.date_out > @bike.date_out)
  end

  private

  def booking_params
    params.require(:booking).permit(:date_in, :date_out, :status)
  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  # def set_bike
  #   @bike = Bike.find(params[:id])
  # end
end
