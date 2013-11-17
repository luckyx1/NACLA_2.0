Feature: I want to have my own account with NACLA
	As a user
	So that I can create my own course packs and comments
	I want to be able to create my own account

Background: I'm on the home page

	Given I am on the home page
	
Scenario: create an account
	When I click on "Sign up"
	And I fill out valid registration information
	Then I should have my own account
	
Scenario: login to the account
	Given I have an account
	And I am logged out
	When I click on "Log in"
	And I fill out correct account information
	Then I am logged in

Scenario: add a course pack to my account
	Given I have an account
	When I am logged in 
	And I am on the "New Course pack" page
	And I create a new course pack named "Test"
	Then "Test" should be added to my account
	
Scenario: write comments
	Given I have an account
	When I am logged in
	And I am on the "Test" course pack page
	Then I should be able to write "Great course pack!" to "Test"

Scenario: create an account with invalid information (sad path)
	When I click on "Sign up"
	And I fill out invalid registration information
	Then I should not have my own account
	
Scenario: login to the account with incorrect information (sad path)
	Given I have an account
	And I am logged out
	When I click on "Log in"
	And I fill out incorrect account information
	Then I should not be logged into my account
