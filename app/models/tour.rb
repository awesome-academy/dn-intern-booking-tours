class Tour < ApplicationRecord
  has_many :tour_details, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :users, through: :feedbacks
  has_many :users, through: :ratings

  validates :place, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :type_of_tour, presence: true

  enum type_of_tour: {periodic: 1, base_on_user: 2}
end
