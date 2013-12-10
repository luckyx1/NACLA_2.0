class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter  :featured_course_packs

  def back_url
    if params[:to] == 'set'
      puts "Set to: "  + params[:return_url]
      session[:return_url] = params[:return_url]
      puts "Session is: " + session[:return_url]
      render :nothing=>true,:status=>:ok
    else
      puts "Returning: " + session[:return_url]
      render text:session[:return_url], :status=>:ok
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
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
