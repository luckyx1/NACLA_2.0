Given(/^the following documents exist:$/) do |table|
  # table is a Cucumber::Ast::Table
   # express the regexp above with the code you wish you had
   table.hashes.each do |cpack|
   	Article.create(cpack)
   end
end

Given(/^I am on the new coursepack page$/) do
  visit '/course_packs/new'  
end

When (/^I fill in '([^"]*)' with '([^"]*)'$/) do |field, value|
  fill_in "course_pack["+ field.downcase.to_str+"]", :with => value
end

When(/^I select the '([^"]*)' as the 'country'$/) do |count|
  select count.to_str
end

When(/^I press the create button$/) do
  click_button 'Create'   
end

Then(/^I should see a new coursepack with the 'title' 'Early Colombia'$/) do
  if page.respond_to? :should
    page.should have_content('Early Colombia')
  else
    assert page.has_content?('Early Colombia')
  end
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
  click_button 'cancel'
end

Then (/^I should not see a new coursepack with the 'title' '([^"]*)'$/) do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
