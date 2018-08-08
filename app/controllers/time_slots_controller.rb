class TimeSlotsController < ApplicationController

  def index
    @available_time_slots = TimeSlot.all_available
  end

end
