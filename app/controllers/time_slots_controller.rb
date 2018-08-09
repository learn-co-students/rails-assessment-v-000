class TimeSlotsController < ApplicationController

  def index
    @available_time_slots = TimeSlot.all_available
    @user_time_slot = UserTimeSlot.new
  end

end
