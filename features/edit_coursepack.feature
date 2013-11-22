Feature: Users should be able to edit already created course packs
	As a user
	So that I can make changes to a course pack
	I want to be able to navigate to a course pack edit page and save changes

Background: Starting at the coursepack homepage
	Given I am on the new coursepack page
	When I fill in 'Title' with 'Early Colombia'
	And I fill in 'Summary' with 'As early as 1392...'
  	And I press the 'Create' button
  	Then I should see 'Listing course_pack'

Scenario: When you edit a course pack the information is changed
	When I follow Edit for coursepack "Early colombia"
	And I add article "Rethining Human rights"
	And I click "Update Course Pack"
	Then I should see "Listing course_pack"
	When I click "show" for coursepack "Early Colombia"
	Then I should see "Rethinking Human rights"

Scenario: When you edit a course pack but don't include title or summary it should give you an error
	When I follow Edit for coursepack "Early colombia"
	And I edit "title" with ""
	And I press "Update course_pack"
  	Then I should see 'You must assign a title and summary' on the page