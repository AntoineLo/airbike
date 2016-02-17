class AnnouncesController < ApplicationController
  before_action :find_bike, only: [:show, :new, :create]


  def show
    @announce = Announce.find(params[:id])
    @bike = Bike.new
  end

  def new
    @announce = announce.new
  end

  def create
    @announce = @user.announces.new(announce_params)
    if @announce.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @announce = Announce.find(params[:id])
    @announce.destroy
    redirect_to :back
  end

  private

  def announce_params
    params.require(:annnouce).permit(:date_in, :date_out)
  end
  # def find_user
  #   @user = User.find(params[:user_id])
  # end
  def find_bike
    @bike = Bike.find(params[:bike_id])
  end

end
