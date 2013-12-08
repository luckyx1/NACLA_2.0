class CommentsController < ApplicationController
  def show
  end
  

  #def comments
  #  respond_to do |format|
  #    format.json{
  #      if params[:course_pack_id]
  #        render json: Comment.where(course_pack_id:params[:course_pack_id])
  #      else
  #        render json: Comment.where(user_id:current_user.id)
  #      end
  #    }
  #  end
  #end


  def create_comment
    if request.xhr?
      comment = Comment.new(comment:params[:comment])
      comment.user_id = current_user.id
      comment.course_pack_id = params[:course_pack_id]
      if comment.save
        render :nothing => true, :status => :ok
      else
        render :nothing => true, :status => :conflict
      end
    else
      redirect '/'
    end
  end

  #def add
  #	if(params[:addstatus] == 'add')
  #		#if params[:article] != "" and params[:username] !="" and params[:comment] != ""
  #			#newcommentSpecs = Hash.new
  #			#newcommentSpecs[:user] = params[:username]
  #			#newcommentSpecs[:comment] = params[:comment]
  #			#newcommentSpecs[:privacy] = "false"
  #			#newcommentSpecs[:postdate] = DateTime.current()
  #			#newcommentSpecs[:article] = params[:article]
	 # 		#newcomment = Comment.new(newcommentSpecs)
  #
	 # 		@status = "Your comment was added successfully."
	 # 	else
	 # 		@status = view_context.get_failure_status_message(params[:username], params[:comment], params[:article])
	 # 	end
	 # 	@par = params
  #		@display = true
  #	end
  #end
  #
  #def delete
  #		if(params[:delstatus] == 'del')
	 # 		if params[:article] != "" and params[:username] !="" and params[:comment] != ""
		#  		@comment = Comment.find(:first, :conditions => {:user => params[:username], :comment => params[:comment], :article => params[:article]})
		#	    if @comment.nil?
  #          @status = "This comment does not exist."
  #        else
  #          @comment.destroy
  #          @status = "Your comment was deleted successfully."
  #        end
		#  	else
		#  		@status = view_context.get_failure_status_message(params[:username], params[:comment], params[:article])
		#  	end
		#  	@par = params
	 # 		@display = true
  #	end
  #end

  def index
    @user = current_user
    @comments = Comment.find_all_by_user_id(@user.id, :order => "created_at desc") || []
  end

end
