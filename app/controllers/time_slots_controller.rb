class TimeSlotsController < ApplicationController
  before_action :require_admin
  skip_before_action :require_admin, only: [:index]
  layout "logged_in"

  def index
    set_user
    if params[:user_id] && (params[:user_id].to_i == session[:user_id] || @user.admin)
      @future_time_slots = TimeSlot.by_user(@user.id).future
      @past_time_slots = TimeSlot.by_user(@user.id).past
    elsif params[:user_id]
      redirect_to "/users/#{@user.id}/time_slots"
    else
      require_admin
      @future_time_slots = TimeSlot.future
      @past_time_slots = TimeSlot.past
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
    @time_slot = TimeSlot.find(params[:id])
  end

  def update
    @time_slot = TimeSlot.find(params[:id])
    @time_slot.update(time_slot_params)
    redirect_to time_slots_path
  end

  def destroy
    if permission_check
      TimeSlot.find(params[:id]).destroy
      set_user
      redirect_to "/time_slots"
    else
      redirect_to '/'
    end
  end

  private

  def time_slot_params
    params.require(:time_slot).permit(:start_time, :duration, :number_of_volunteers_needed)
  end
end
