class Friend < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, :through => :bookings
  has_many :favorite, dependent: :destroy

  scope :filter_by_gender, ->(gender) { where(gender: gender) }
  scope :filter_by_city, ->(city) { where(city: city) }
  scope :filter_by_age_range, ->(age_range) { where(age: age_range) }

  validates :first_name, presence: true
  validates :location, presence: true
  validates :city, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :price, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
