class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: %i[new create]
  before_action :set_user, only: %i[new create]

  def new
    @friend = Friend.find(params[:friend_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.friend_id = @friend.id
    @booking.total = @booking.total_price
    # @friend.available = false
    if @booking.save
      redirect_to friends_path, notice: "Booking confirmed ! Your total price : #{@booking.total}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
  
  def set_friend
    @friend = Friend.find(params[:friend_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
