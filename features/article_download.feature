Feature: download articles
  As a user
  So that I can view the content of the articles
  I want to download a copy of the articles
  
Background: I'm on the article search page 

  Given the following articles exist:
  | title                    | description                              | publication_date| tags | volume | issue |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900  | 20-Sep-2010    | Brazil, colony | 3 | 4 |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico    | 14-Dec-2003    | drugs, war, poltics     | 6 | 6 |
  | Chile 40 Years Later     | Chile over the last 40 years             | 10-Oct-2013    | Chile, coup, politics | 9 | 3 |
  | Modern Politics of Chile | The political climate of modern day Chile| 2-Apr-2011     | republic, election    | 3 | 2 |
  | Chavismo After Chavez    | Information about movement based on Chavez| 28-June-2013  | Chavez, Chavismo      | 9 | 2 |
  And I am on the article search page
  And I follow "Course Packs"
  And I follow "Articles"
  
Scenario: download article logged in 
  Given I am logged in
  When I search for 'Brazil'
  And I click on 'Brazilian Colonialism'
  And I click on 'Download'
  Then the article 'Brazilian Colonialism' should be downloaded
  
Scenario: download article not logged in (sad path)
  Given I am not logged in
  When I search for 'Chile'
  And I click on 'Chile 40 Years Later'
  And I click on 'Download'
  Then I should be asked to log in 
  And the article 'Chile 40 Years Later' should not be downloaded
  
