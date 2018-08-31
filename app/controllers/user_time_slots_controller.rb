class UserTimeSlotsController < ApplicationController
  layout "logged_in"

  def create
    @user = User.find(session[:user_id])
    params[:user_time_slot].each do |time_slot|
      UserTimeSlot.find_or_create_by(user_id: @user.id, time_slot_id: time_slot.last[:time_slot_id].to_i, comments: time_slot.last[:comments])
    end

    redirect_to user_path(@user)
  end

  def destroy
    UserTimeSlot.find(params[:id]).destroy
    set_user
    redirect_to "/users/#{@user.id}/time_slots"
  end

  def update
    @user_time_slot = UserTimeSlot.find(params[:id])
    @user_time_slot.comments = params[:user_time_slot][:comments]
    @user_time_slot.save
    set_user
    redirect_to "/users/#{@user.id}/time_slots"
  end

  private
  def user_time_slot_params
    params.require(:user_time_slot).permit(:time_slot_id)
  end

end
