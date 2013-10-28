Feature: Add comments

	As a user 
	So that I can comment on articles
	I want to be able to add or delete comments

	Background: documents exists in the database

	Given the following documents exits:
	| title                    | description                               | published_date |
	| Brazilian Colonialism    | Colonialism of Brazil between 1800-1900   | 10-Jan-2004    |

	And I am on the new comments page:

	Scenario: Add a comment
		When I fill in all the entries
		And I press the submit button
		Then a new comment should be created

	Scenario: Delete a comment
		When I am on the delete comments page
		When I fill in all the entries
		And I press the submit button
		A comment should be deleted