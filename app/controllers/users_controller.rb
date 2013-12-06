class UsersController < ApplicationController

  before_filter :require_login, except: [:new, :create]
   
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
    userid = current_user.id
    coursepacks = current_user.course_packs
    coursepacks.each do |coursepack|
      comments = coursepack.comments
      comments.each do |comment|
        comment.destroy
      end
      coursepack.destroy
    end
    comments = current_user.comments
    comments.each do |comment|
      Comment.destroy(comment.id)
    end
    session[:user_id] = nil
    User.destroy(userid)
    redirect_to '', :notice => "Your account was deleted"
  end

end
