class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if session[:user_id] && session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
    elsif session[:user_id] && session[:user_id] != params[:id].to_i
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    else
      #add flash message
      redirect_to '/'
    end
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def set_user
    @user = User.find_by(session[:user_id])
  end
end
