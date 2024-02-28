class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :friend
  has_many :reviews, dependent: :destroy

  def total_price
    number_of_days = (end_date - start_date).to_i + 1
    return number_of_days * friend.price
  end
end
