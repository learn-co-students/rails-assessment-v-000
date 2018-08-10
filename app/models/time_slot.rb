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

  def readable_date
    self.start_time.strftime("%B %d, %Y")
  end

  def readable_start_time
    self.start_time.strftime("%I:%M %p")
  end

  def duration_in_hours
    self.duration/60
  end

  def end_time
    self.start_time + (self.duration * 60)
  end

  def readable_end_time
    self.end_time.strftime("%I:%M %p")
  end

end
