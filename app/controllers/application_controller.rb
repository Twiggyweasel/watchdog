class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?,:require_admin
  
  def current_user
    @current_user ||= User.find_by(user_name: session[:user_name]) if session[:user_name]
  end
  
  def logged_in?
    !!session[:user_name]

  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to do that!"
      redirect_to login_path
    end
  end
  
  def require_admin
    if current_user.access == "General Access"
      flash[:danger] = "You must be logged in as an admin to do that!"
      redirect_to :back
    end
  end
end
