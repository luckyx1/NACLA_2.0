Feature: create a coursepack

  As an Educator
  So that I can create a custom curriculum
  I want to be able to combine documents together to create a coursepack

Background: documents exists in the database
  Given I have an account

    And the following articles exist:
  | title                    | description                              | publication_date| tags | volume | issue |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900  | 20-Sep-2010    | Brazil, colony | 3 | 4 |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico    | 14-Dec-2003    | drugs, war, poltics     | 6 | 6 |
  | Chile 40 Years Later     | Chile over the last 40 years             | 10-Oct-2013    | Chile, coup, politics | 9 | 3 |
  | Modern Politics of Chile | The political climate of modern day Chile| 2-Apr-2011     | republic, election    | 3 | 2 |
  | Chavismo After Chavez    | Information about movement based on Chavez| 28-June-2013  | Chavez, Chavismo      | 9 | 2 |

  And I am on edit course pack page

Scenario: search for article
  When I fill in 'Early Colombia' for the 'Title'
  When I select the 'Colombia' as the 'country'
  And I press the search button
  Then I should see an article with the 'title' 'Early Colombia'


Scenario: add article to course pack
  When I fill in 'Early Colombia' for the 'Title'
  When I select the 'title' checkbox
  And I hit the search button
  And I add press "Add Article to Course Pack"
  Then I should see the 'Early Colombia' article added to my course pack 

Scenario: remove article from course pack
  When I fill in 'Early Colombia' for the 'Title'
  When I select the 'title' checkbox
  And I hit the search button
  And I add press "Add Article to Course Pack"
  And I press the "X" button next to the newly added article
  Then I should see the 'Early Colombia' article removed from my course pack





