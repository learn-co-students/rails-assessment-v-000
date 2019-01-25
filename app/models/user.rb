class User < ApplicationRecord
  has_secure_password
  has_many :user_time_slots
  has_many :time_slots, through: :user_time_slots

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
