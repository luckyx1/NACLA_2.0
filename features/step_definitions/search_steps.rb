Given(/^the following exists in the database:$/) do |table|
  # table is a Cucumber::Ast::Table
  #pending # express the regexp above with the code you wish you had
  table.hashes.each do |document|
    Document.create(document)
  end

end

Given(/^I am on the coursepack search page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the search box with keywords$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I check the 'search by title' box$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click the search button$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list of documents containing the search term\(s\) in their title\.$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I check the 'search by description' box$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list of documents containing the search term\(s\) in their description\.$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I check the 'search by tag' box$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list of documents containing the search term\(s\) in their tags\.$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I check the 'search by date' box$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the 'from' box with the beginning date$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the 'to' box with the ending date$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list of documents published between the two dates specified\.$/) do
  pending # express the regexp above with the code you wish you had
end
