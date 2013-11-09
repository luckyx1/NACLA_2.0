 Then(/^I am on the article\/coursepack search page$/) do
 	visit  '/search'
end

When(/^I am logged in as NACLA$/) do
  pending # waiting to see how to log in
end

When(/^I follow the "(.*?)" page$/) do |arg1|
 click_link(arg1)
end

Then(/^I should see the regular "(.*?)" page$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an option to feature prebundled coursepacks$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^regular users should not$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an option to set the price of prebundled coursepacks$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I follow the page for a coursepack$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an option to feature or set the price of that coursepack$/) do
  pending # express the regexp above with the code you wish you had
end
