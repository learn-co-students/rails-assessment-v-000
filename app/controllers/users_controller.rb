class UsersController < ApplicationController

  def profile
  end

  def show
      @user = User.find_by_id(params[:id])
      if !@user
        redirect_to root_path, alert: "User not found"
      end
  end

  def edit
  end

  def update
  end

end
