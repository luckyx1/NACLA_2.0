Feature: I want to have my own profile page
	As a user
	So that I can see my course packs, comments, and edit my user information
	I want to be able to view my own profile page
	
Background: I have a user account
  Given I have a user account with username "Alex", password "pass", and email "alex@test.com"
  And the following documents exist:
  | title                    | description                                | publication_date | tags                  | volume | issue |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900    | 20-Sep-2010      | Brazil, colony        | 3      | 4     |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico      | 14-Dec-2003      | drugs, war            | 6      | 6     |
  | Chile 40 Years Later     | Chile over the last 40 years               | 10-Oct-2013      | Chile, coup, politics | 9      | 3     |
  | Modern Politics of Chile | The political climate of modern day Chile  | 2-Apr-2011       | republic, election    | 3      | 2     |
  | Chavismo After Chavez    | Information about movement based on Chavez | 28-June-2013     | Chavez, Chavismo      | 9      | 2     |
  And I have coursepack "Chile" with articles "Modern Politics of Chile" and "Chile 40 Years Later"
  And I have coursepack "Mexico" with article "Drug Cartels, Mexico"
  And I have coursepack "Brazil" with article "Brazilian Colonialism"
  And I have coursepack "Current" with articles "Chavismo After Chavez" and "Chile 40 Years Later"
  And I am on my user profile page

Scenario: change password correctly (happy path)
  When I click on "Change Password"
  And I fill out "old_password" with "pass"
  And I fill out "password" with "password"
  And I fill out "password_confirmation" with "password"
  And I click on "Change Password"
  And I click on "Log out"
  When I login with username "Alex" and password "password"
  Then I should be logged in as "Alex"

@javascript
Scenario: show a coursepack
  Then I should see coursepacks "Brazil", "Chile", "Current"
  When I am on the "Brazil" course pack page
  Then I should see title "Brazil"
  And I should see article "Brazilian Colonialism"
  But I should not see title "Chile"
  And I should not see title "Current"

Scenario: view all coursepacks
  Then I should see coursepacks "Brazil", "Chile", "Current"
  When I click on "Click Here For More Course Packs"
  Then I should see coursepacks "Brazil", "Chile", "Current", "Mexico"
  
Scenario: change password with nonmatching passwords (sad path)
  When I click on "Change Password"
  And I fill out "old_password" with "pass"
  And I fill out "password" with "password"
  And I fill out "password_confirmation" with "pass2"
  And I click on "Change Password"
  Then I should not have changed my password
  
Scenario: change password with incorrect password (sad path)
  When I click on "Change Password"
  And I fill out "old_password" with "pass112398"
  And I fill out "password" with "password"
  And I fill out "password_confirmation" with "password"
  And I click on "Change Password"
  Then I should not have changed my password  

Scenario: change password, cancel (sad path)
  When I click on "Change Password"
  And I click on "Cancel"
  Then I should be on my profile page
  
Scenario: change password, don't enter new passwords (sad path)
  When I click on "Change Password"
  And I fill out "old_password" with "pass"
  And I click on "Change Password"
  Then I should not have changed my password
