class TimeSlotsController < ApplicationController
  before_action :require_admin
  skip_before_action :require_admin, only: [:index]
  layout "logged_in"

  def index
    set_user
    if params[:user_id]
      @user = User.find(params[:user_id])
      @time_slots = @user.time_slots
   else
     @time_slots = TimeSlot.all
   end
  end

  def show
    set_user
    @time_slot = TimeSlot.find(params[:id])
  end

  def new
    set_user
    @time_slot = TimeSlot.new
  end

  def create
    @time_slot = TimeSlot.create(time_slot_params)
    redirect_to time_slots_path
  end

  def edit
    set_user
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
