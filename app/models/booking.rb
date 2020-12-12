class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour_detail

  validates :number_of_bookers, presence: true

  scope :recent_bookings, ->{order created_at: :desc}

  enum payment_status: {not_paid: 0, paid: 1}
  enum status: {booked: 1, pending: 2, canceled: 3}
end
