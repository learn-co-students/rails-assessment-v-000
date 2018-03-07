class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
  helper_method :current_user
  skip_before_action :verify_authenticity_token

  def index
  end

  def require_logged_in
   redirect_to '/'  unless current_user
  end

  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
=======
>>>>>>> c858639fb6437c258ab72ff5fedad265d21948a9

end
