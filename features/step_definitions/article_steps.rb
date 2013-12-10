Given(/^I am on the article search page$/) do
	visit "/search"
end

Given(/^I click "(.*?)"$/) do |button|
	click_on button
end

When /I uncheck "(.*)"/ do |box|
  uncheck box
end

Then(/^I should see the issue "(.*?)"$/) do |text|
    page.should have_content(text)
end

Then(/^I should not see the issue "(.*)"$/) do |text|
    page.should_not have_content(text)
end

Given(/^the following articles exist:$/) do |table|
  table.hashes.each do |pack|
   	Article.create(pack)
   end
end

And /^I wait for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
end

Then /I should be on the "(.*)" information page/ do |title|
  page.should have_content title
end

When /I should see a "(.*)" button for "(.*)"/ do |button, title|
  page.should have_content title
  page.should have_content button
end

When /I should not see a "(.*)" button for "(.*)"/ do |button, title|
  page.should have_content title
  page.should_not have_content button
end

When /I should see a summary for "(.*)"/ do |title|
  page.should have_content Article.find_by_title(title).description
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field.to_sym, :with => value)
end
