class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def index
    if params[:start_date].present? && params[:location].present?
      @start_date = Date.parse(params[:start_date]).strftime("%Y/%m/%d")
      @end_date = Date.parse(params[:end_date]).strftime("%Y/%m/%d")

      @bikes = Bike.where("(date_in >= '#{@start_date}' AND date_in <= '#{@end_date}' AND date_out >= '#{@end_date}')
                        OR (date_in <= '#{@start_date}' AND date_out >= '#{@start_date}' AND date_out <= '#{@end_date}')
                        OR (date_in <= '#{@start_date}' AND date_out >= '#{@end_date}')")
                   .near(params[:location], 15)
    elsif params[:location].present?
      @bikes = Bike.near(params[:location], 15)
    elsif params[:start_date].present?
      @bikes = search_by_date
    else
      @bikes = Bike.all
    end

    @markers = Gmaps4rails.build_markers(@bikes) do |bike, marker|
      marker.lat bike.latitude
      marker.lng bike.longitude
    end
    @markers.reject! { |marker| marker[:lat] == nil }
  end

  def show
    @bike = Bike.find(params[:id])
    @bike_coordinates = { lat: @bike.latitude, lng: @bike.longitude }
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = current_user.bikes.new(bike_params)
    if @bike.save
      redirect_to user_path(current_user)
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
    params.require(:bike).permit(:address, :price, :kind, :helmet, :picture, :description, :baby_seat, :date_in, :date_out, photos: [])
  end

  def find_user
    @user = User.find(params[:user_id])
    params.require(:bike).permit(:address, :kind, :helmet, :picture, :description, :baby_seat, photos: [])
  end

  def search_by_date
    @start_date = Date.parse(params[:start_date]).strftime("%Y/%m/%d")
    @end_date = Date.parse(params[:end_date]).strftime("%Y/%m/%d")

    Bike.where("(date_in >= '#{@start_date}' AND date_in <= '#{@end_date}' AND date_out >= '#{@end_date}')
             OR (date_in <= '#{@start_date}' AND date_out >= '#{@start_date}' AND date_out <= '#{@end_date}')
             OR (date_in <= '#{@start_date}' AND date_out >= '#{@end_date}')")
  end

end
