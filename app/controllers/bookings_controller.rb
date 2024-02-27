class BookingsController < ApplicationController
  
  def new
    @booking = Booking.new
  end

  def create
    raise
    @booking = Booking.new(booking_params)
    @booking.save
  end

  private

  def set_user
    @user = User.find(params[user.id])
  end

  def booking_params
    params.require(:booking).require(:start_date, :end_date)
  end
end
