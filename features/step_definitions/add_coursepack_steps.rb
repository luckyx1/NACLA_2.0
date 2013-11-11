 Then(/^I am on the article\/coursepack search page$/) do
 	visit  '/course_packs'
end

When(/^I am logged in as "(.*?)"$/) do 
	current_user.should_not be_nil
end

When(/^I follow the "(.*?)" page$/) do |link|
 click_link(link)
end

Then(/^I should see "(.*?)"$/) do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
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
