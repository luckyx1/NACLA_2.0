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

  @javascript
Scenario: create an coursepack with no articles
  When I fill in 'Title' with 'Early Colombia'
  #When I select the 'Colombia' as the 'country'
  And I fill in 'Summary' with 'As early as 1392...'
  And I press the 'Create' button
  Then I should see a new coursepack with the 'title' as 'Early Colombia'

Scenario: start creating a coursepack but cancel before saving
  When I fill in 'Title' with 'Latino subcultures in California'
  And I press the 'cancel' button
  Then I should not see a new coursepack with the 'title' 'Latino Subcultures in California'

  @javascript
Scenario: try to create a course pack without a title
  When I fill in 'Summary' with 'Course pack summary'
  And I press the 'Create' button
  Then I should see 'You must assign a title and summary' on the page

  @javascript
Scenario: try to create course pack without summary
  When I fill in 'Title' with 'Latino subcultures in California'
  And I press the 'cancel' button
  Then I should see 'Listing course_pack'




