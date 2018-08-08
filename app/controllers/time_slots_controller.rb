class TimeSlotsController < ApplicationController

  def index
    @time_slots = TimeSlot.all
  end

end
