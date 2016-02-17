class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
    @bikes = current_user.bikes
    @booking = current_user.bookings
  end

end
