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
    if date_check == false && booking_date_check == false
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

  def booking_date_check
    booked_for_this_id = Booking.where(bike_id: @bike.id)
    if booked_for_this_id.empty?
      return false
    else
      booked_for_this_id.each do |b|
        if ((b.date_in <= @booking.date_out) && (b.date_out >= @booking.date_out)) || ((@booking.date_in >= b.date_in) && (@booking.date_in <= b.date_out))
          return true
        end
      end
      return false
    end
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
