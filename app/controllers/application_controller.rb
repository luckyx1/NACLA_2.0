class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  protected 
  def require_login
    if current_user.nil?
      redirect_to('/log_in')
    end
  end
end
