class UserTimeSlotsController < ApplicationController
  layout "logged_in"

  def new
    set_user
    @user_time_slot = UserTimeSlot.new
    @available_time_slots = TimeSlot.available_to_user(@user)
  end

  def create
    set_user
    id_to_use = params[:user_time_slot][:user_id].to_i
    if permission_check(id_to_use)
      params[:user_time_slot].each do |time_slot|
        if time_slot.first != "user_id"
          UserTimeSlot.find_or_create_by(user_id: id_to_use, time_slot_id: time_slot.last[:time_slot_id].to_i, comments: time_slot.last[:comments])
        end
      end
      redirect_to "/users/#{id_to_use}/time_slots"
    else
      redirect_to '/'
    end
  end

  def edit
    set_user
    @user_time_slot = UserTimeSlot.find_by_id(params[:id])
    if permission_check(@user_time_slot.user_id)
      @time_slot = TimeSlot.find(@user_time_slot.time_slot_id)
    else
      redirect_to "/users/#{@user.id}/time_slots"
    end
  end

  def update
    set_user
    @user_time_slot = UserTimeSlot.find(params[:id])
    if permission_check(@user_time_slot.user_id)
      @user_time_slot.comments = params[:user_time_slot][:comments]
      @user_time_slot.save
      redirect_to "/users/#{@user.id}/time_slots"
    else
      redirect_to '/'
    end
  end

  def destroy
    set_user
    @user_time_slot = UserTimeSlot.find(params[:id])
    if permission_check(@user_time_slot.user_id)
      @user_time_slot.destroy
      redirect_to "/users/#{@user.id}/time_slots"
    else
      redirect_to '/'
    end
  end

  private
  def user_time_slot_params
    params.require(:user_time_slot).permit(:time_slot_id, :user_id)
  end

  def permission_check(id)
    @user.admin || @user.id == id
  end

end
