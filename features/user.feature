Feature: I want to have my own account with NACLA
	As a user
	So that I can see my course packs and comments
	I want to be able to create my own account

Background: I'm on the NACLA page

	Given I am on the NACLA home page
	
Scenario: create an account
	When I press "create an account"
	And I fill out valid registration information
	Then I should have my own account
	
Scenario: login to the account
	When I press "login"
	And I fill out correct account information
	Then I am logged in

Scenario: add a course pack to my account
	When I am logged in 
	And I am on the "Add a course pack" page
	And I create a new course pack named "Test"
	Then "Test" should be added to my account
	
Scenario: write comments
	When I am logged in
	And I am on the "Course packs" page
	Then I should be able to write "Great course pack!" to "Test"

Scenario: create an account with invalid information (sad path)
	When I press "create an account"
	And I fill out invalid registration information
	Then I should have not have my own account
	And I should get to try again
	
Scenario: login to the account with incorrect information (sad path)
	When I press "login"
	And I fill out incorrect account information
	Then I should not be logged into my account
	And I should get to try again

