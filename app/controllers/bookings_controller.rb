class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend, only: %i[new create]
  before_action :set_user, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.friend_id = @friend.id
    @booking.total = @booking.total_price
    if @booking.save
      redirect_to dashboard_my_bookings_path, notice: "Réservation enregistrée ! Prix total : #{@booking.total}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_my_bookings_path
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save!
    redirect_to dashboard_my_booked_friends_path
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_friend
    @friend = Friend.find(params[:friend_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
