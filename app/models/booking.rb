class Booking < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_id', class_name: 'User'
  belongs_to :galaxy
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true

  enum status: [:pending, :accepted, :declined]

  # TODO: Write method validate :validate_created_at to check valid dates


end
