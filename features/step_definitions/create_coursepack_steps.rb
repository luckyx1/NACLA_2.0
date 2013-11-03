Given(/^the following documents exist:$/) do |table|
  # table is a Cucumber::Ast::Table
   # express the regexp above with the code you wish you had
   table.hashes.each do |cpack|
   	Article.create(cpack)
   end
end

Given(/^I am on the new coursepack page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in 'Early Colombia' for the 'Title'$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select the 'Colombia' as the 'country'$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I press the create button$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a new coursepack with the 'title' 'Early Colombia'$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in 'California Missions' for the 'Title'$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select 'Mexico' as the 'country'$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I add articles$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I press the 'create' button$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a new coursepack with the 'title' 'California Missions'$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in 'Latino subcultures in California' as for the 'Title'$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I press the 'cancel' button$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not see a new coursepack with the 'title' 'Latino Subcultures in California'$/) do
  pending # express the regexp above with the code you wish you had
end
