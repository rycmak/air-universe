class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :galaxies, foreign_key: 'owner_id', class_name: 'Galaxy'
  has_many :bookings, foreign_key: 'customer_id', class_name: 'Booking'
  has_one_attached :photo
  has_many :reviews, through: :bookings

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
