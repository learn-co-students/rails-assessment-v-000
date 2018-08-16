class UserTimeSlot < ApplicationRecord
  belongs_to :user
  belongs_to :time_slot

  #validates :email, uniqueness: {scope:  [:user_id, :time_slot_id]}

  def validate #not sure this is correct code or necessary at all
    if UserTimeSlot(where: time_slot_id = self.time_slot_id).count == TimeSlot.find(self.time_slot_id).capacity
      record.errors[attribute] << (options[:message] || "This time slot has reached capacity")
    end
  end


end
