class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || home_path
  end

  def index

  end

  def home
    if !current_user
      redirect_to root_path
    end

    @newest_users=User.newest_users
    @top_views=Workout.top_views

  end

end
