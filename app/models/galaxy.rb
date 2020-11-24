class Galaxy < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
