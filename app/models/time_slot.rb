class TimeSlot < ApplicationRecord
  has_many :user_time_slots
  has_many :users, through: :user_time_slots

  def full
    self.users.count == self.number_of_volunteers_needed
  end

  def slots_open
    self.number_of_volunteers_needed - self.users.count
  end
  
end
