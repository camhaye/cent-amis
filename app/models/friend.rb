class Friend < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, :through => :bookings
  has_many :favorite, dependent: :destroy

  validates :first_name, presence: true
  validates :location, presence: true
  validates :city, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :price, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
