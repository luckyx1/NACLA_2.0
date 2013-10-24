Feature: I want to search the archives

	As an Educator
	So that I can find documents to add to my coursepack
	I want to search by specific keywords

Background: documents exists in the database

	Given the following exists in the database:
	| title                    | description                               | publication_date | tags                |
	| Brazilian Colonialism    | Colonialism of Brazil between 1800-1900   | 20-Sep-2010      | Brazil, colonialism |
	| Modern Politics of Chile | The political climate of modern day Chile | 2-Apr-2011       | republic, election  |
	| Drug Cartels, Mexico     | The history of drug cartels in Mexico     | 14-Dec-2003      | drugs, war          |

	And I am on the coursepack search page

Scenario: search by document title
	When I fill in the search box with keywords
	And I check the 'search by title' box
	And I click the search button
	Then I should see a list of documents containing the search term(s) in their title.

Scenario: search by document description  
	When I fill in the search box with keywords
	And I check the 'search by description' box
	And I click the search button
	Then I should see a list of documents containing the search term(s) in their description.

Scenario: search by document tags
	When I fill in the search box with keywords
	And I check the 'search by tag' box
	And I click the search button
	Then I should see a list of documents containing the search term(s) in their tags.

Scenario: search by date
	When I check the 'search by date' box
	And I fill in the 'from' box with the beginning date
	And I fill in the 'to' box with the ending date
	And I click the search button
	Then I should see a list of documents published between the two dates specified.

