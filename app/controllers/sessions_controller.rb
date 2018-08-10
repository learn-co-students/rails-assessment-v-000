class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif User.find_by(email: params[:user][:email]).authenticate(params[:user][:password])
      @user = User.find_by(email: params[:user][:email])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
