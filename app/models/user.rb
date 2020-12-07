class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :tour_details, through: :bookings
  has_many :tours, through: :ratings
  has_many :tours, through: :feedbacks

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  include BCrypt

  validates :full_name, presence: true
  validates :email, presence: true,
    length: {maximum: Settings.user.email.max_length},
    format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true,
    length: {minimum: Settings.user.password.min_length}
  validates :phone_number, presence: true,
    length: {minimum: Settings.user.phone.min_length,
             maximum: Settings.user.phone.max_length}
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :address, presence: true

  enum role: {user: 0, admin: 1}

  has_secure_password
end
