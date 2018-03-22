class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :home]

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || home_path
  end

  def index
  end

  def home
    @newest_users=User.newest_users
    @top_views=Workout.top_views
  end

end
