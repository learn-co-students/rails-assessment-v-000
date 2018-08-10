class TimeSlotsController < ApplicationController
  def index

  end

  def new
    @time_slot = TimeSlot.new
  end

  def create
    @time_slot = TimeSlot.create(time_slot_params)
    redirect_to time_slots_path
  end

  def edit
    @time_slot = TimeSlot.find(params[:id])
  end

  def update
    @time_slot = TimeSlot.find(params[:id])
    @time_slot.update(time_slot_params)
    redirect_to time_slots_path
  end

  private

  def time_slot_params
    params.require(:time_slot).permit(:start_time, :duration, :number_of_volunteers_needed)
  end
end
