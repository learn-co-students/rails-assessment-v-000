class UserTimeSlotsController < ApplicationController
  layout "logged_in"

  def new
    set_user
    @user_time_slot = UserTimeSlot.new
    @available_time_slots = TimeSlot.all_available
  end

  def create
    if permission_check
      set_user
      params[:user_time_slot].each do |time_slot|
        UserTimeSlot.find_or_create_by(user_id: @user.id, time_slot_id: time_slot.last[:time_slot_id].to_i, comments: time_slot.last[:comments])
      end

      redirect_to "/users/#{@user.id}/time_slots"
    else
      redirect_to '/'
    end
  end

  def edit
    set_user
    @user_time_slot = UserTimeSlot.find_by(user_id: params[:user_id], time_slot_id: params[:id])
    @time_slot = TimeSlot.find(params[:id])
  end

  def destroy
    if permission_check
      UserTimeSlot.find(params[:id]).destroy
      set_user
      redirect_to "/users/#{@user.id}/time_slots"
    else
      redirect_to '/'
    end
  end

  def update
    if permission_check
      @user_time_slot = UserTimeSlot.find(params[:id])
      @user_time_slot.comments = params[:user_time_slot][:comments]
      @user_time_slot.save
      set_user
      redirect_to "/users/#{@user.id}/time_slots"
    else
      redirect_to '/'
    end
  end

  private
  def user_time_slot_params
    params.require(:user_time_slot).permit(:time_slot_id)
  end

end
