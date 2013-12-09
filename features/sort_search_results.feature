Feature: Sort my search results
	As a user
	So that I can more easily choose which articles to read or add to my course pack
	I want to be able to sort my search results

Background:
	Given I have a user account with username "Alex", password "pass", and email "alex@test.com"
  And the following documents exist:
  | title                    | description                                | publication_date | tags                  | volume | issue |
  | Brazilian Colonialism    | Colonialism of Brazil between 1800-1900    | 20-Sep-2010      | Brazil, colony        | 3      | 4     |
  | Drug Cartels, Mexico     | The history of drug cartels in Mexico      | 14-Dec-2003      | drugs, war            | 6      | 6     |
  | Chile 40 Years Later     | Chile over the last 40 years               | 10-Oct-2013      | Chile, coup, politics | 9      | 3     |
  | Modern Politics of Chile | The political climate of modern day Chile  | 2-Apr-2011       | republic, election    | 3      | 2     |
  | Chavismo After Chavez    | Information about movement based on Chavez | 28-June-2013     | Chavez, Chavismo      | 9      | 2     |
  And I have coursepack "Chile" with articles "Modern Politics of Chile" and "Chile 40 Years Later"
  And I have coursepack "Mexico" with article "Drug Cartels, Mexico"
  And I have coursepack "Brazil" with article "Brazilian Colonialism"
  And I have coursepack "Current" with articles "Chavismo After Chavez" and "Chile 40 Years Later"
	And I am on the article search page

@javascript
Scenario: Sort search results alphabetically by title
	When I choose "title_sort_articles"
	And I fill in "search_input" with "ch"
	Then I expect to see "Chavismo After Chavez" before "Chile 40 Years Later"

@javascript
Scenario: Sort search results by publication date
	When I choose "date_sort_articles"
	And I fill in "search_input" with "m"
	Then I expect to see "Drug Cartels, Mexico" before "Brazilian Colonialism"