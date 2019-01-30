class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if auth && !User.find_by(email: auth['info']['email'])#should this be in user controller?
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        u.password = auth[:uid]
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif auth && User.find_by(email: auth['info']['email'])
      flash[:message] = "You already created an account associated with that email address. Please log in using your password."
      redirect_to '/login'
    elsif User.find_by(email: session_params[:email]) && User.find_by(email: session_params[:email]).authenticate(session_params[:password])
      @user = User.find_by(email: params[:user][:email])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif User.find_by(email: session_params[:email]) && !User.find_by(email: session_params[:email]).authenticate(session_params[:password])
      flash[:message] = "Your email and password do not match, please try again."
      redirect_to '/login'
    else
      flash[:message] = "There is no account for that email address, please create an account."
      redirect_to new_user_path
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

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
