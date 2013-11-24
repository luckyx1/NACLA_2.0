class CommentsController < ApplicationController
  def show
  end

  def add
  	if(params[:addstatus] == 'add') 
  		#if params[:article] != "" and params[:username] !="" and params[:comment] != ""
  			#newcommentSpecs = Hash.new
  			#newcommentSpecs[:user] = params[:username]
  			#newcommentSpecs[:comment] = params[:comment]
  			#newcommentSpecs[:privacy] = "false"
  			#newcommentSpecs[:postdate] = DateTime.current()
  			#newcommentSpecs[:article] = params[:article]
	  		#newcomment = Comment.new(newcommentSpecs)

	  		@status = "Your comment was added successfully."
	  	else
	  		@status = view_context.get_failure_status_message(params[:username], params[:comment], params[:article])
	  	end
	  	@par = params
  		@display = true
  	end
  end

  def delete
  		if(params[:delstatus] == 'del')
	  		if params[:article] != "" and params[:username] !="" and params[:comment] != ""
		  		@comment = Comment.find(:first, :conditions => {:user => params[:username], :comment => params[:comment], :article => params[:article]})
			    if @comment.nil?
            @status = "This comment does not exist."
          else
            @comment.destroy
            @status = "Your comment was deleted successfully."
          end
		  	else
		  		@status = view_context.get_failure_status_message(params[:username], params[:comment], params[:article])
		  	end
		  	@par = params
	  		@display = true
  	end
  end

  def index
  end

end
