class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :feedbacks, class_name: Feedback.parents,
                       dependent: :destroy

  validates :content, presence: true
end
