Feature: Add comments

	As a user 
	So that I can comment on articles
	I want to be able to add or delete comments

	Background: comments existing in the databse
		Given I have a user account with username "Charlie", password "notpassword", and email "rails@fake.com"
		And the user "Charlie" has an empty coursepack with title "Comment Test"
		And the user "Charlie" has a test comment on the coursepack "Comment Test"

@javascript
Scenario: Viewing comments of a coursepack while not logged in.
	Given I log out
	And I go to the test coursepack show page
	Then I should see "Test comment for test course pack."

@javascript
Scenario: Viewing comments of a coursepack while logged in.
	When I go to the test coursepack show page
	Then I should see "Test comment for test course pack."

@javascript
Scenario: Commenting on a coursepack while not logged in.
	Given I log out
	And I go to the test coursepack show page
	Then I should not see "Post"

@javascript
Scenario: Commenting on a coursepack while logged in.
	When I go to the test coursepack show page
	And I type "Blah Blah Blah" into "comment"
	And I click on "Post"
	Then I should see "Blah Blah Blah"

@javascript
Scenario: viewing all my comments
  When I go to the comments page
  Then I should see "Comment Test"
  
  
