class Review < ApplicationRecord
  belongs_to :booking

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true

  def self.total_rating(reviews)
    return 0 if reviews.empty?

    ratings = reviews.map(&:rating)
    ratings.sum.to_f / ratings.length
  end
end
