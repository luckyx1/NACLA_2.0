Feature: I want to search the archives

	As an Educator
	So that I can find documents to add to my coursepack
	I want to search by specific keywords

Background: documents exists in the database

	Given the following exists in the database:
	| title                    | description                               | publication_date | tags                |
	| Brazilian Colonialism    | Colonialism of Brazil between 1800-1900   | 20-Sep-2010      | Brazil, colony 			|
	| Modern Politics of Chile | The political climate of modern day Chile | 2-Apr-2011       | republic, election  |
	| Drug Cartels, Mexico     | The history of drug cartels in Mexico     | 14-Dec-2003      | drugs, war          |

	And I am on the coursepack search page

Scenario: search by document title
	When I fill in "Search for:" with "Modern Politics of Chile"
	And I choose "category_title"
	And I press "Search"
	Then I should see "Modern Politics of Chile"

Scenario: search by document description  
	When I fill in "Search for:" with "1900"
	And I choose "category_description"
	And I press "Search"
	Then I should see "Brazilian Colonialism"

Scenario: search by document tags
	When I fill in "Search for:" with "drugs"
	And I choose "category_tags"
	And I press "Search"
	Then I should see "Drug Cartels, Mexico"

Scenario: search with no keywords
	When I press "Search"
	Then I should see "Please enter a search term."

Scenario: search without specifying a category
	When I fill in "Search for:" with "Brazilian"
	And I press "Search"
	Then I should see "Please select a search category."

Scenario: list all articles in database
	When I press "List All"
	Then I should see "Brazilian Colonialism"
	And I should see "Modern Politics of Chile"
	And I should see "Drug Cartels, Mexico"





