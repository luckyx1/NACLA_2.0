class CommentsController < ApplicationController
  def show
  end

  def add
  	if(params[:addstatus] == 'add')
  		commentstring = params[:comment]
  		username = params[:username]
  		datetime = DateTime.current()
  		article = params[:article]
  		if article != "" and username !="" and commentstring != ""
  			newcommentSpecs = Hash.new
  			newcommentSpecs[:user] = username
  			newcommentSpecs[:comment] = commentstring
  			newcommentSpecs[:privacy] = "false"
  			newcommentSpecs[:postdate] = datetime
  			newcommentSpecs[:article] = article
	  		newcomment = Comment.new(newcommentSpecs)
	  		newcomment.comment = commentstring
	  		newcomment.user = username
	  		newcomment.privacy = false
	  		newcomment.article = article
	  		newcomment.postdate = datetime
	  		newcomment.save
	  		@status = "Your comment was added successfully."
	  	else
	  		error = ""
	  		count = 0

	  		if (username == "")
	  			error = error + "the username field was left blank"
	  			count = count + 1
	  		end

	  		if commentstring == ""
	  			if count > 0
	  				error = error + ", "
	  			end
	  			error = error + "the comment field was left blank"
	  			count = count + 1
	  		end

	  		if article == ""
	  			if count > 0
	  				error = error + ", "
	  			end
	  			error = error + "the article url field was left blank"
	  			count = count + 1
	  		end
	  		@status = "There was an error(s) in your submission: " + error
	  	end
	  	@par = params
  		@display = true
  	end
  end

  def delete
  		if(params[:delstatus] == 'del')
  		commentstring = params[:comment]
  		username = params[:username]
  		datetime = DateTime.current()
  		article = params[:article]
  		if article != "" and username !="" and commentstring != ""
	  		@comment = Comment.find(:first, :conditions => {:user => username, :comment => commentstring, :article => article})
		    if @comment
		    	@comment.destroy
	  			@status = "Your comment was deleted successfully."
	  		else
	  			@status = "This comment does not exist."
	  		end
	  	else
	  		error = ""
	  		count = 0

	  		if (username == "")
	  			error = error + "the username field was left blank"
	  			count = count + 1
	  		end

	  		if commentstring == ""
	  			if count > 0
	  				error = error + ", "
	  			end
	  			error = error + "the comment field was left blank"
	  			count = count + 1
	  		end

	  		if article == ""
	  			if count > 0
	  				error = error + ", "
	  			end
	  			error = error + "the article url field was left blank"
	  			count = count + 1
	  		end
	  		@status = "There was an error(s) in your submission: " + error
	  	end
	  	@par = params
  		@display = true
  	end
  end

  def index
  end
end
