class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @bikes = current_user.bikes
    @booking = current_user.bookings
    @asked_bookings = my_asked_bookings
  end

  private

  def my_asked_bookings
    my_asked_bookings = []
    @bikes.each do |bike|
      Booking.where(bike_id: bike.id).to_a.each do |booking|
        my_asked_bookings << booking
      end
    end
    if my_asked_bookings.compact.first.nil?
      my_asked_bookings = []
    else
      my_asked_bookings.compact
    end
  end

end
