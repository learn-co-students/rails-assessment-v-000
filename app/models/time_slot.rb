class TimeSlot < ApplicationRecord
  has_many :user_time_slots
  has_many :users, through: :user_time_slots

  validates :start_time, presence: true
  validates :duration, presence: true, numericality: {greater_than_or_equal_to: 30, less_than_or_equal_to: 720}
  validates :number_of_volunteers_needed, presence: true, numericality: {greater_than: 0}

  def available
    UserTimeSlot.slots_taken(self) < self.number_of_volunteers_needed && self.start_time > Date.today
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

  def self.past
    where("start_time < ?", Date.today)
  end

  def self.future
    where("start_time >= ?", Date.today)
  end

end
