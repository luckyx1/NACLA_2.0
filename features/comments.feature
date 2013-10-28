Feature: Add comments

	As a user 
	So that I can comment on articles
	I want to be able to add or delete comments

	Background: comments existing in the databse

	Given the following comments exits:
	| comment 				| user 			| privacy 	| postdate 		| article 					|
	| This is awesome |	student1	|	false   	| 1-Jan-2000 	| Spanish Culture   |

	And I am on the comments front page

Scenario: Add a comment successfully
	When I press "Add Comment"
	And I fill in "comment" with "Even more awesome"
	And I fill in "article" with "History of Panama"
	And I fill in "username" with "student2"
	And I press "Add Comment"
	Then I should see "Your comment was added successfully."

Scenario: Add a comment without entering a comment
	When I press "Add Comment"
	And I fill in "article" with "History of Panama"
	And I fill in "username" with "student2"
	And I press "Add Comment"
	Then I should see "the comment field was left blank"

Scenario: Add a comment without entering an article url
	When I press "Add Comment"
	And I fill in "comment" with "Even more awesome"
	And I fill in "username" with "student2"
	And I press "Add Comment"
	Then I should see "the article url field was left blank"

Scenario: Add a comment without entering a username
	When I press "Add Comment"
	And I fill in "comment" with "Even more awesome"
	And I fill in "article" with "History of Panama"
	And I press "Add Comment"
	Then I should see "the username field was left blank"

Scenario: Delete a comment successfully
	When I press "Delete Comment"
	And I fill in "comment" with "This is awesome"
	And I fill in "article" with "Spanish Culture"
	And I fill in "username" with "student1"
	And I press "Delete Comment"
	Then I should see "Your comment was deleted successfully."

Scenario: Delete a comment without entering a comment
	When I press "Delete Comment"
	And I fill in "article" with "Spanish Culture"
	And I fill in "username" with "student1"
	And I press "Delete Comment"
	Then I should see "the comment field was left blank"

Scenario: Delete a comment without entering an article url
	When I press "Delete Comment"
	And I fill in "comment" with "This is awesome"
	And I fill in "username" with "student1"
	And I press "Delete Comment"
	Then I should see "the article url field was left blank"

Scenario: Delete a comment without entering a username
	When I press "Delete Comment"
	And I fill in "comment" with "This is awesome"
	And I fill in "article" with "Spanish Culture"
	And I press "Delete Comment"
	Then I should see "the username field was left blank"

Scenario: Delete a comment that does not exist in the database
	When I press "Delete Comment"
	And I fill in "comment" with "This is not awesome"
	And I fill in "article" with "American Culture"
	And I fill in "username" with "student3"
	And I press "Delete Comment"
	Then I should see "This comment does not exist."