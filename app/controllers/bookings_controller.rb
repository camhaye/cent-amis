class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: %i[new create]

  def new
    @friend = Friend.find(params[:friend_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user.id
    @booking.user_id = @user
    @booking.friend_id = @friend.id

    if @booking.save
      redirect_to friend_path(@friend)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_friend
    @friend = Friend.find(params[:friend_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
