class UserTimeSlots < ApplicationController

  def new
  end

  def create
    @user_time_slot = UserTimeSlot.create(user_time_slot_params)

    redirect_to user_path(@user)
  end

  def user_time_slot_params
    params.require(:user_time_slot).permit(:time_slot_id)
  end

end
