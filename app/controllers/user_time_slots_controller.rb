class UserTimeSlotsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    params[:user_time_slot][:time_slot].each do |time_slot|
      UserTimeSlot.create(user_id: @user.id, time_slot_id: time_slot)
    end

    redirect_to user_path(@user)
  end

end
