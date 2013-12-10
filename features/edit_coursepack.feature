Feature: Users should be able to edit already created course packs
	As a user
	So that I can make changes to a course pack
	I want to be able to navigate to a course pack edit page and save changes

Background: Starting at the coursepack homepage
  Given I have an account
  And the following documents exist:
  | title                    | description                               | publication_date | tags                |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900   | 20-Sep-2010      | Brazil, colony      |
  | Modern Politics of Chile | The political climate of modern day Chile | 2-Apr-2011       | republic, election  |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico     | 14-Dec-2003      | drugs, war          |
  And I am on the new coursepack page
  When I fill in 'Title' with 'Early Colombia'
  And I fill in 'Summary' with 'As early as 1392...'
  And I press the 'Create' button
  Then I should be on the "course_packs" page


@javascript
Scenario: When you edit a course pack the information is changed
	When I select the button "Edit" for coursepack "Early Colombia"
  When I fill in "search_input" with "Brazilian Colonialism"
  And I wait for 2 seconds
	And I add article "Brazilian Colonialism"
	And I click "Update"
	Then I should see "Brazilian Colonialism"

@javascript
Scenario: When you edit a course pack but don't include title or summary it should give you an error
	When I select the button "Edit" for coursepack "Early Colombia"
	And I edit "Title" with ""
	And I press the 'Update' button
	Then I should see 'You must assign a title and summary' on the page
	
@javascript
Scenario: delete course pack
  When I select the button "Destroy" for coursepack "Early Colombia"
  And I confirm
  Then "Early Colombia" should be deleted
  
