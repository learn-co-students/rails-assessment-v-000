class UserTimeSlotsController < ApplicationController
  layout "logged_in"

  def new
    @available_time_slots = TimeSlot.all_available
    @user_time_slot = UserTimeSlot.new
  end

  def create
    @user = User.find(session[:user_id])
    params[:user_time_slot].each do |time_slot|
      UserTimeSlot.find_or_create_by(user_id: @user.id, time_slot_id: time_slot.last[:time_slot_id].to_i)
    end

    redirect_to user_path(@user)
  end

  def destroy
    UserTimeSlot.find(params[:id]).destroy
    @user = session[:user_id]
    redirect_to user_path(@user)
  end

end
