Feature: Sort my search results
	As a user
	So that I can more easily choose which articles to read or add to my course pack
	I want to be able to sort my search results

Background:
	Given the following articles exist:
	| | | | | | | |

	And the following coursepacks exist:
	| | | | | | | |


	And I am on the search page

Scenario: Sort search results alphabetically by title
	When I click on Articles Radio
	And I click on Title sort
	And I enter 'names'
	Then I should see 'A' before 'B'

Scenario: Sort search results by publication date
	When I click on Articles Radio
	And I click on Date sort
	And I enter 'names'
	Then I should see 'Old' before 'New'
