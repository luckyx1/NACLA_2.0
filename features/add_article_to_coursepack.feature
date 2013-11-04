Feature: create a coursepack

  As an Educator
  So that I can create a custom curriculum
  I want to be able to combine documents together to create a coursepack

Background: documents exists in the database

  Given the following documents exist:
  | title                    | description                               | published_date |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900   | 10-Jan-2004    |
  | Modern Politics of Chile | The political climate of modern day Chile | 5-Nov-1998     |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico     | 4-May-1985     |

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





