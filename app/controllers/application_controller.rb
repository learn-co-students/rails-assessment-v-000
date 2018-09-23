class ApplicationController < ActionController::Base
  before_action :require_login
  skip_before_action :require_login, only: [:welcome]

  def welcome
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    end
  end

  private
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def require_admin
    return head(:forbidden) unless User.find(session[:user_id]).admin
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
