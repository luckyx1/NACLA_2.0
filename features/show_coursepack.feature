Feature: Course pack owners should be able to view and edit their course packs
	As a user
	So that I can see my course pack in greater detail
	I want to be able to click on a previously created course pack and view its contents


Background: Starting at the coursepack homepage
	
  Given I have an account
  Then I should be on the "course_packs" page

@javascript
Scenario: When you click on a course pack it shows it
	Given the following documents exist:
  | title                    | description                               | publication_date | tags                |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900   | 20-Sep-2010      | Brazil, colony      |
  | Modern Politics of Chile | The political climate of modern day Chile | 2-Apr-2011       | republic, election  |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico     | 14-Dec-2003      | drugs, war          |
  And I am on the new coursepack page
  When I fill in 'Title' with 'Early Colombia'
  And I fill in 'Summary' with 'As early as 1392...'
  And I press the 'Create' button
	When I select the link "Show" for coursepack "Early Colombia"
	And I should see "As early as 1392..."

@javascript
Scenario: When you create a course pack, then click show it should show the same info
	When I tap on "New Course Pack"
	And I fill in 'Title' with 'Early Mexico'
    And I fill in 'Summary' with 'In 1672...'
    And I press the 'Create' button
    Then I should be on the "course_packs" page
    When I select the link "Show" for coursepack "Early Mexico"
    Then I should see "In 1672..."



