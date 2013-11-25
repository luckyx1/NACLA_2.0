Feature: Add comments

	As a user 
	So that I can comment on articles
	I want to be able to add or delete comments

	Background: comments existing in the databse

	Given the following users exist:
	| | | | |


Scenario: Viewing comments of a coursepack while not logged in.
	Given I am on the "coursepack_name" show page
	Then I should see "comment_string"

Scenario: Viewing comments of a coursepack while logged in.
	Given I am logged in as "username"
	And I am on the "coursepack_name" show page
	Then I should see "comment_string"

Scenario: Commenting on a coursepack while not logged in.
	Given I am logged in as "username"
	And I am on the "coursepack_name" show page
	And I type "Blah Blah Blah" into "comment_input"
	And I click on "Post"
	Then I should see "Blah Blah Blah"

Scenario: Commenting on a coursepack while logged in.
	Given I am logged in as a "username"
	And I am on the "coursepack_name" show page
	And I type "Blah Blah Blah" into "comment_input"
	And I click on "Post"
	Then I should see "Blah Blah Blah"

