class Friend < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, :through => :bookings

  validates :first_name, presence: true
  validates :location, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :price, presence: true

end
