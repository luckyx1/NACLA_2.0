Feature: admin account
  As NACLA
  So that I can create featured and/or predefined coursepacks
  I want to have an admin account with extra capabilities 

Background: 
  Given there is an admin account
  
Scenario: log in as admin 
  When I am logged out
  And I log in as admin
  Then I should see extra admin functionality
  
Scenario: predefine coursepacks
  Given I am logged in as admin
  When I create a new coursepack
  Then the coursepack should be viewable by all users
  And the coursepack should be searchable by all users

Scenario: featuring coursepacks
  Given I am logged in as admin
  When I create a new coursepack
  And I mark the coursepack to be featured
  Then the coursepack should be featured on the home page
  
Scenario: regular user cannot feature coursepacks (sad path)
  Given I am not logged in as admin
  When I create a new coursepack
  Then I should not see an option to feature the coursepack
