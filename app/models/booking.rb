class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :friend

  def total_price
    number_of_days = (end_date - start_date).to_i + 1
    return number_of_days * friend.price
  end

  def booked_dates(friends)
    console.log('coucou')
    @booked_dates = self.where(friend: friend).pluck(:start_date, :end_date)
  end
end
