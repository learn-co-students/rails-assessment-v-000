class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        if request.env["omniauth.auth"]
            @user = User.from_omniauth(request.env["omniauth.auth"])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.find_by(name: params[:name].downcase)
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                @user ||= User.new(name: params[:name])
                flash[:notice] = "Incorrect login details. Please try again or sign up for an account."
                render :new
            end
        end
    end
    
    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end
