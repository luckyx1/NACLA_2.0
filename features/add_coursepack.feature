Feature: I want to add coursepacks

 As NACLA
 So we can provide prebundled coursepacks to users
 I want to make available particular coursepacks to users

Background: articles have been added to the database

 And I am on the article/coursepack search page

Scenario: feature prebundled coursepacks
	When I am logged in as NACLA
	And I follow the "add a coursepack" page
	Then I should see the regular "add a coursepack" page
	And I should see an option to feature prebundled coursepacks
	But regular users should not

Scenario: set price of prebundled coursepacks
	When I am logged in as NACLA
	And I follow the "add a coursepack" page
	Then I should see the regular "add a coursepack" page
	And I should see an option to set the price of prebundled coursepacks
	But regular users should not

Scenario: edit prebundled coursepacks options
	When I am logged in as NACLA
	And I follow the page for a coursepack
	Then I should see an option to feature or set the price of that coursepack
	But regular users should not
