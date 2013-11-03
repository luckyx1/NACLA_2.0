Feature: create a coursepack

  As an Educator
  So that I can create a custom curriculum
  I want to be able to combine documents together to create a coursepack

Background: documents exists in the database

  Given the following documents exist:
  | title                    | description                               | publication_date | tags                |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900   | 20-Sep-2010      | Brazil, colony      |
  | Modern Politics of Chile | The political climate of modern day Chile | 2-Apr-2011       | republic, election  |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico     | 14-Dec-2003      | drugs, war          |

  And I am on the new coursepack page

Scenario: create an coursepack with no articles
  When I fill in 'Early Colombia' for the 'Title'
  When I select the 'Colombia' as the 'country'
  And I press the create button
  Then I should see a new coursepack with the 'title' 'Early Colombia'


Scenario: create a coursepack and add files
  When I fill in 'California Missions' for the 'Title'
  When I select 'Mexico' as the 'country'
  And I add articles
  And I press the 'create' button
  Then I should see a new coursepack with the 'title' 'California Missions'

Scenario: start creating a coursepack but cancel before saving
  When I fill in 'Latino subcultures in California' as for the 'Title'
  And I press the 'cancel' button
  Then I should not see a new coursepack with the 'title' 'Latino Subcultures in California'




