class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :rate_number, presence: true
end
