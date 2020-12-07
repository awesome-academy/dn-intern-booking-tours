class TourDetail < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :tour, dependent: :destroy
  has_many :users, through: :bookings

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
end
