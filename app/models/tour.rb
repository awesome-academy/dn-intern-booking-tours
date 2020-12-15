class Tour < ApplicationRecord
  has_many :tour_details, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :users, through: :feedbacks
  has_many :users, through: :ratings

  accepts_nested_attributes_for :tour_details

  validates :place, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :type_of_tour, presence: true

  scope :sort_place_name, ->{order :place}
  scope :recent_tours, ->{order created_at: :desc}
  scope :search_tours, ->(place){where "place LIKE ?", "%#{place}%" if place}

  enum type_of_tour: {periodic: 1, base_on_user: 2}
end
