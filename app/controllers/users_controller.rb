class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_admin, only: [:index]

  layout "logged_in", :except => :new

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new, :layout => false
    end
  end

  def show
    set_user
    if @user.admin
      @admin = @user
      @user = User.find(params[:id])
    elsif @user.id != params[:id].to_i
      redirect_to user_path(@user)
    end
  end

  def index
    set_user
    @users = User.all
  end

  def edit
    set_user
    if @user.admin
      @admin = @user
      @user = User.find(params[:id])
    elsif @user.id != params[:id].to_i
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
