class Friend < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :first_name, presence: true
  validates :location, presence: true
  validates :available, presence: true
  validates :content, presence: true
  validates :age, presence: true
  validates :good_at, presence: true
  validates :gender, presence: true
  validates :price, presence: true

end
