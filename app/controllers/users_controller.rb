class UsersController < ApplicationController

  before_filter :require_login, except: [:new, :create, :usernames]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
   
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), :notice=>"You have created an account."
    else
      render "new"
    end
  end

  def update
    if params[:commit] == "Cancel"
      redirect_to '/users'
    else
      user = User.authenticate(current_user.username, params[:old_password])
      if user != nil
        if params[:password] == params[:password_confirmation]
          if user.id == current_user.id 
            user.password = params[:password]
            if user.save
              redirect_to '', :notice=>"Your password has been changed."
            else
              flash[:notice] = "Your new password is not valid. Please enter another"
              render "edit"
            end
          else
            flash[:notice] = "You shouldn't be here..."
            render "edit"
          end
        else
          flash[:notice] = "Password doesn't match confirmation"
          render "edit"
        end
      else
        flash[:notice] = 'Your password is incorrect'
        render "edit"
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @coursepacks = CoursePack.find_all_by_user_id(@user[:id], :order => "created_at desc", :limit =>5) || []
    @comments = Comment.find_all_by_user_id(@user.id, :order => "created_at desc", :limit => 10) || []
  end
  
  def index
    redirect_to user_path(current_user[:id])
  end

  def destroy
    userid = params[:id]
    if current_user.admin and User.where(admin: true).size <= 1 and current_user.id.to_s == userid
      redirect_to user_path(current_user.id), :notice => "You are the last admin. You can't delete your profile"
    else
      if userid == current_user.id.to_s or current_user.admin
        user = User.find(userid)
        delete_user(user)
        if current_user.id.to_s == userid
          session[:user_id] = nil
          user.destroy
          redirect_to '', :notice => "Your account was deleted"
        else
          message = user.username + "'s account was deleted"
          user.destroy
          redirect_to user_path(current_user.id), :notice => message
        end
      else
        redirect_to user_path(current_user.id), :notice => "You don't have permission to do that"
      end
    end
  end

  def usernames
    if request.xhr?
      render json: User.get_names.to_json, :status=>:ok
    else
      redirect_to '/'
    end

  end
  
  private

  def record_not_found
    redirect_to '/log_out', :notice => "You were logged out for accessing a non-existant account"
  end

  def delete_user(user)
    coursepacks = user.course_packs
    coursepacks.each do |coursepack|
      comments = coursepack.comments
      comments.each do |comment|
        comment.destroy
      end
      coursepack.destroy
    end
    comments = user.comments
    comments.each do |comment|
      comment.destroy
    end
  end



end
