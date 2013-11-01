module CommentHelper

  def get_failure_status_message(username, comment, article)
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
	return "There was an error(s) in your submission: " + error
  end

end
