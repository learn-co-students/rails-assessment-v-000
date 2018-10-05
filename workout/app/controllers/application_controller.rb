class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
   helper_method :current_user
    helper_method :logged_in?
    
    before_action :require_login
    
    private
    
        def current_user
            User.find_by(id: session[:user_id])    
        end
        
        def logged_in?
            session[:user_id]
        end
    
        def require_login
            unless logged_in?
                flash[:notice] = "You must be logged in to access that page."
                redirect_to root_path
            end
        end
  
end
