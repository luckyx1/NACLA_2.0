Feature Name: I want users to only see certain pages when logged in
  As NACLA
  So I can protect my content from unauthorized users
  I want to make sure users are logged in before using the site

Background: I have an account
  Given I have a user account with username "Alex", password "pass", and email "alex@test.com"
  
Scenario: logged in 
  Given I am logged in
  When I visit any page
  Then I should see the page
  
Scenario: not logged in (sad path)
  Given I am not logged in 
  When I visit any page  #not sure which pages require this
  Then I should be asked to log in or create an account
  When I login with username "Alex" and password "pass"
  Then I should see the page
