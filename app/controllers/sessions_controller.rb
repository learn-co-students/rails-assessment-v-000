class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      user = User.find_by(:user_name => params[:user_name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user.id)
      else
        render 'session/new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
