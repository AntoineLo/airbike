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
    @booking.status = "pending"
    if !date_check
      @booking.save
      flash[:notice] = "Booking successfully created"
      BookingMailer.booking_confirmation(@booking).deliver_now
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Date not matching ! Please try again"
      render "bikes/show"
    end
  end

  # def edit
  # end

  def update
    @booking = Booking.find(params[:id])
    if params[:commit] == "Confirm"
      @booking.status = "confirmed"
    elsif params[:commit] == "Reject"
      @booking.status = "rejected"
    end
    @booking.save
    redirect_to :back
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user)
  end

  def date_check
    (@booking.date_in < @bike.date_in) || (@booking.date_out > @bike.date_out) ||
    (Booking.all.each do |b|
      (b.date_in < @booking.date_out) || (b.date_out > @booking.date_out)
    end)
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
