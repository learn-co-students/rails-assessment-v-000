class ApplicationController < ActionController::Base
  def welcome
    @user = User.find(session[:user_id])
  end
end
