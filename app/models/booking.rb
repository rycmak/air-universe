class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :galaxy
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true

  # Write method validate :validate_created_at to check valid dates


end
