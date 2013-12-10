Feature: I want to search and view NACLA's articles
	As a user
	So that I can find and preview relevant articles
	I want to be able to find articles
	
Background: I'm on the article search page 

  Given the following articles exist:
  | title                    | description                              | publication_date| tags | volume | issue |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900  | 20-Sep-2010    | Brazil, colony | 3 | 4 |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico    | 14-Dec-2003    | drugs, war, poltics     | 6 | 6 |
  | Chile 40 Years Later     | Chile over the last 40 years             | 10-Oct-2013    | Chile, coup, politics | 9 | 3 |
  | Modern Politics of Chile | The political climate of modern day Chile| 2-Apr-2011     | republic, election    | 3 | 2 |
  | Chavismo After Chavez    | Information about movement based on Chavez| 28-June-2013  | Chavez, Chavismo      | 9 | 2 |
  And I am on the article search page

 
@javascript
Scenario: Search by title
  When I fill in "search_input" with "ch"
  Then I should see the issue "Chile 40 Years Later"
  And I should see the issue "Modern Politics of Chile"
  And I should see the issue "Chavismo After Chavez"
  But I should not see the issue "Brazilian Colonialism"
  And I should not see the issue "Drug Cartels, Mexico" 

@javascript
Scenario: Search by description
  When I fill in "search_input" with "chile"
  And I uncheck "Title"
  And I wait for 2 seconds
  Then I should see the issue "Chile 40 Years Later"
  And I should see the issue "Modern Politics of Chile"
  But I should not see the issue "Brazilian Colonialism"
  And I should not see the issue "Drug Cartels, Mexico" 
  And I should not see the issue "Chavismo After Chaves"
  
@javascript
Scenario: show an article while logged in
	Given I have an account
	When I am logged in
	And I am on the article search page
  When I fill in "search_input" with "Mexico"
  When I click "Drug Cartels, Mexico"
  Then I should be on the "Drug Cartels, Mexico" information page
  And I should see a "Download" button for "Drug Cartels, Mexico"
  And I should see a summary for "Drug Cartels, Mexico"
  
@javascript
Scenario: show an article while not logged in (sad path)
  When I fill in "search_input" with "Mexico"
  When I click "Drug Cartels, Mexico"
  Then I should be on the "Drug Cartels, Mexico" information page
  And I should not see a "Download" button for "Drug Cartels, Mexico"
  And I should see a summary for "Drug Cartels, Mexico"


  
