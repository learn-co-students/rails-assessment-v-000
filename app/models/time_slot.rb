class TimeSlot < ApplicationRecord
  has_many :user_time_slots
  has_many :user, through: :user_time_slots
end
