class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_admin, only: [:index]

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
    if session[:user_id] == params[:id].to_i #can this be dried up?
      set_user
    elsif User.find(session[:user_id]).admin
      @user = User.find(params[:id])
      @admin = User.find(session[:user_id])
    elsif session[:user_id] && session[:user_id] != params[:id].to_i
      set_user
      redirect_to edit_user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save && @user.id == session[:user_id]
      redirect_to user_path(@user)
    elsif @user.save
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :admin)
  end
end
