class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_sessions

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

  private

    def authenticate_user!
      redirect_to '/login' unless current_user
    end

    def authenticate_admin!
      redirect_to '/' unless current_user && current_user.is_admin?
    end
end
