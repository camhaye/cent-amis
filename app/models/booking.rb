class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :friend

  def total_price(start_date, end_date, price)
    number_of_days = (end_date - start_date).to_i + 1
    return number_of_days * price
  end
end
