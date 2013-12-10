Feature: I want users to only see certain pages when logged in
  As NACLA
  So I can protect my content from unauthorized users
  I want to make sure users are logged in before using the site

Background: I have an account
  Given I have a user account with username "Alex", password "pass", and email "alex@test.com"
  
Scenario: logged in to visit profile page
  When I visit the "PROFILE" page
  Then I should be logged in as "Alex"
  And I should see "Welcome"
  
Scenario: logged in to view own coursepacks
  When I visit the "COURSE PACKS" page
  Then I should see "Course Packs"
  
Scenario: not logged in while visiting profile page(sad path)
  Given I am not logged in 
  When I visit the "PROFILE" page
  Then I should be asked to "Log in"
  When I login with username "Alex" and password "pass"
  Then I should be logged in as "Alex"
  And I should see "Welcome"
