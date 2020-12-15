class TourDetail < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :tour
  has_many :users, through: :bookings

  scope :recent_tour_details, ->{order created_at: :desc}

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
end
