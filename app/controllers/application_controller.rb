class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter  :featured_course_packs

  def back_url
    if params[:to] == 'set'
      session[:return_url] = params[:return_url]
      render :nothing=>true,:status=>:ok
    else
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


  def trim(items)
    unless items.nil?
      if items.first.is_a? CoursePack
        items.each do |coursepack|
          coursepack.summary = coursepack.summary[0...300] + '...' if coursepack.summary.length > 300
        end
      else
        items.each do |comment|
          comment.comment = comment.comment[0...300] + '...' if comment.comment.length > 300
        end
      end

      return items
    end
  end


  protected 
  def require_login
    if current_user.nil?
      redirect_to('/log_in')
    end
  end
end
