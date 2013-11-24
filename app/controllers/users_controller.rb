class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to '', :notice=>"You have created an account."
    else
      render "new"
    end
  end

  def update
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

  def index
    @coursepacks = CoursePack.find(:all, :order => "created_at desc", :limit =>5)
    @coursepacks ||= []
  end

  def destroy
    userid = current_user.id
    session[:user_id] = nil
    User.destroy(userid)
    redirect_to '', :notice => "Your account was deleted"
  end
end	
