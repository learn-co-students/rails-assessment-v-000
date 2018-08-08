class TimeSlot < ApplicationRecord
  has_many :user_time_slots
  has_many :users, through: :user_time_slots

  def available
    self.users.count < self.number_of_volunteers_needed
  end

  def slots_open
    self.number_of_volunteers_needed - self.users.count
  end

  def self.all_available
    available = []
    self.all.each do |time_slot|
      if time_slot.available
        available << time_slot
      end
    end
    available
  end

end
