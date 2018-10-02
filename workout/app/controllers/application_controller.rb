class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  

  def authenticate_required
     if !logged_in?
      redirect_to login_path
    end
  end
  
  def logged_in?
    !!current_user
  end
  
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
