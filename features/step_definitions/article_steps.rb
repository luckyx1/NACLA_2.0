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

When(/^I follow "(.*?)"$/) do |link|
  check(link)
end

Then(/^I should see the issue "(.*?)"$/) do |text|
 if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then(/^I should not see the issue "(.*?)"$/) do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
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
