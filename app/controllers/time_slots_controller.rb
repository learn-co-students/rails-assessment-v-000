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
     @time_slots = TimeSlot.future
   end
  end

  def show
    set_user
    @time_slot = TimeSlot.find(params[:id])
  end

  def new
    set_user
    if params[:user_id]
      @user_time_slot = UserTimeSlot.new
      @available_time_slots = TimeSlot.all_available
    else
      @time_slot = TimeSlot.new
    end
  end

  def create
    @time_slot = TimeSlot.new(time_slot_params)
    if @time_slot.valid?
      @time_slot.save
      redirect_to time_slots_path
    else
      set_user
      render :new
    end
  end

  def edit
    set_user
    if params[:user_id]
      @user_time_slot = UserTimeSlot.find_by(user_id: params[:user_id], time_slot_id: params[:id])
      @time_slot = TimeSlot.find(params[:id])
    else
      @time_slot = TimeSlot.find(params[:id])
    end
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
