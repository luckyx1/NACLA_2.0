Given(/^I am on the article search page$/) do
	visit "/search"
end

Given(/^I click "(.*?)"$/) do |button|
	click_on button
end

When(/^I have not entered a search query$/) do
  pending # express the regexp above with the code you wish you had
end

#Then(/^I should see the issues "(.*?)" and "(.*?)"$/) do |arg1, arg2|
#  pending # express the regexp above with the code you wish you had
#end

When(/^I choose option "(.*?)"$/) do |link|
  choose link
end

When /I uncheck "(.*)"/ do |box|
  uncheck box
end

Then(/^I should see the issue "(.*?)"$/) do |text|
 if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then(/^I should not see the issue "(.*)"$/) do |text|
  if page.respond_to? :should
    page.should_not have_content(text)
  else
    assert page.has_no_content?(text)
  end
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
