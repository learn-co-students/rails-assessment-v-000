class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  layout "logged_in", :except => :new

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if session[:user_id] && session[:user_id] == params[:id].to_i
      set_user
    elsif session[:user_id] && session[:user_id] != params[:id].to_i
      set_user
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def index
    @users = User.all
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
