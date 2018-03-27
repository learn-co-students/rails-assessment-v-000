class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users=User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    if !@user
      redirect_to users_path, alert: "User not found"
    elsif @user.id == current_user.id
       render "dashboard"
    end


  end

end
