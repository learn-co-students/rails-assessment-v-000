class ApplicationController < ActionController::Base
  def welcome
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
