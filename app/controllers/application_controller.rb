class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :back_url, :featured_course_packs

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def back_url
    @back_url = request.referer
  end

  def featured_course_packs
    @featured_course_packs = CoursePack.where(:featured=>true).limit(5)
  end
  
  protected 
  def require_login
    if current_user.nil?
      redirect_to('/log_in')
    end
  end
end
