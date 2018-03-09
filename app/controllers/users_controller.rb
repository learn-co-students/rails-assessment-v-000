class UsersController < ApplicationController

  def index
  @users=User.all
  end

  def show
      @user = User.find_by_id(params[:id])
      if !@user
        redirect_to users_path, alert: "User not found"
      end
  end


end
