class User < ApplicationRecord
  has_secure_password
  has_many :user_time_slots
  has_many :time_slots, through: :user_time_slots
end
