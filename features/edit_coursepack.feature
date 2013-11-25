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
	When I select "Edit" for coursepack "Early colombia"
	#And I add article "Rethining Human rights"
	And I click "Update"
	When I select "Show" for coursepack "Early Colombia"
	#Then I should see "Rethinking Human rights"

@javascript
Scenario: When you edit a course pack but don't include title or summary it should give you an error
	When I select "Edit" for coursepack "Early colombia"
	And I edit "title" with "''"
	And I press "Update"
  	Then I should see 'You must assign a title and summary' on the page