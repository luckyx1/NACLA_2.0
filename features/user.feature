Feature: I want to have my own account with NACLA
	As a user
	So that I can create my own course packs and comments
	I want to be able to create my own account

Background: I'm on the home page

	Given I am on the home page
	
Scenario: create an account
	When I click on "Register for an account"
	And I fill out valid registration information
	Then I should have my own account with username "Alex"
	
Scenario: login to the account
	Given I have an account
	And I am logged out
	When I fill out correct account information
	Then I should be logged in as "Alex"

@javascript
Scenario: delete account
  Given I have an account
  And I click "Delete Profile"
  And I confirm
  Then I should no longer have an account

@javascript
Scenario: add a course pack to my account
	Given I have an account
	And I create a new course pack named "Test" with summary "Test Summary"
	Then "Test" should be added to my account
	
@javascript	
Scenario: write comments
	Given I have an account
	And I create a new course pack named "Test" with summary "Test Summary"
	And I am on the "Test" course pack page
	Then I should be able to write "Great course pack!" to "Test"

Scenario: create an account with invalid information (sad path)
	When I click on "Register for an account"
	And I fill out invalid registration information
	Then I should not have my own account
	
Scenario: login to the account with incorrect information (sad path)
	Given I have an account
	And I am logged out
	When I fill out incorrect account information
  And I click on "Sign In"
	Then I should not be logged in as "Alex"
