class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
