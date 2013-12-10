Feature: admin account
  As NACLA
  So that I can create featured and/or predefined coursepacks
  I want to have an admin account with extra capabilities 

Background: 
  Given there is an admin account
  And the admin account has a coursepack with title "Test" and summary "Test"
  And I am on the home page
  
@javascript
Scenario: log in as admin 
  When I log in as admin
  And I edit the "Test" course pack
  Then I should see extra admin functionality
  
#Scenario: predefine coursepacks
 # Given I am logged in as admin
 # When I create a new coursepack
 # Then the coursepack should be viewable by all users
 # And the coursepack should be searchable by all users

@javascript
Scenario: featuring coursepacks
  When I log in as admin
  And I edit the "Test" course pack
  And I mark the coursepack to be featured
  Then the coursepack should be featured on the home page
  
@javascript
Scenario: regular user cannot feature coursepacks (sad path)
  When I have a user account with username "Alex", password "pass", and email "alex@test.com"
  And I create a new course pack named "Test" with summary "Test Summary"
  Then I should not see an option to feature the coursepack
  
@javascript
Scenario: delete own account as last admin
  When I log in as admin
  And I click "Delete Profile"
  And I confirm
  Then I should see "You are the last admin. You can't delete your profile"
  
  
