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
  fill_in  field.downcase.to_str, :with => value
end

When(/^I select the '([^"]*)' as the 'country'$/) do |count|
  select count.to_str
end

When(/^I press the '([^"]*)' button$/) do |button|
  click_button button   
end

Then(/^I should see a new coursepack with the 'title' as '([^"]*)'$/) do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end






Then (/^I should not see a new coursepack with the 'title' '([^"]*)'$/) do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
