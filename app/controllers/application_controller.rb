class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :which_game?

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def which_game?
     game = Game.find(params[:game_id])
     return game
  end
end
