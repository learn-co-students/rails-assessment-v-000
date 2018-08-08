class UserTimeSlot < ApplicationRecord
  belongs_to :user
  belongs_to :time_slot
end
