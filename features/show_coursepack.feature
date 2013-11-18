Feature: Course pack owners should be able to view and edit their course packs
	As a user
	So that I can see my course pack in greater detail
	I want to be able to click on a previously created course pack and view its contents
	As well as
	As a user
	So that I can make changes to a course pack
	I want to be able to navigate to a course pack edit page and save changes

Background: Starting at the coursepack homepage
	Given I am on the new coursepack page
	When I fill in 'Title' with 'Early Colombia'
	And I fill in 'Summary' with 'As early as 1392...'
  	And I press the 'Create' button
  	Then I should see 'Listing course_pack'


Scenario: When you click on a course pack it shows it
	When I select "show" for coursepack "Early Colombia"
	I should be on the "show page"
	And I should see "As early as 1392..."
	
Scenario: When you create a course pack, then click show it should show the same info
	When I click on "new coursepack page"
	And I fill in 'Title' with 'Early Mexico'
    And I fill in 'Summary' with 'In 1672...'
    And I press the 'Create' button
    Then I should see 'Listing course_pack'
    When I click "show" for coursepack "Early Mexico"
    Then I should the "In 1692..."

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

