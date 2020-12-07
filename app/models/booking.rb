class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour_detail

  validates :number_of_bookers, presence: true

  enum status: {booked: 1, pending: 2, canceled: 3}
end
