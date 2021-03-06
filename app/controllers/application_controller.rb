class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?,:require_admin
  before_action :set_paper_trail_whodunnit
  before_filter:time_cache
  before_filter :set_timezone

  def set_timezone
    Time.zone = 'Central Time (US & Canada)'
  end

  def current_user
    @current_user ||= User.find_by(employee_num: session[:user]) if session[:user]
  end
  
  def time_cache
    @firstset = Hour.limit(7)
    @secondset = Hour.offset(7)
  end
  
  
  
  def logged_in?
    !!session[:user]

  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to do that!"
      redirect_to login_path
    end
  end
  
  def require_admin
    if current_user.clearance_id != 1
      flash[:danger] = "You must be logged in as an admin to do that!"
      redirect_to :back
    end
  end
  
  def user_for_paper_trail
    logged_in? ? current_user.first_name + " " + current_user
    .last_name : 'Public user'  # or whatever
  end
end
