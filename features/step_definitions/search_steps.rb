Given(/^the following exists in the database:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |article|
  	Article.create(article)
  end
end

When /^(?:|I )choose "([^\"]*)"$/ do |field|
  choose(field)
end

Given(/^I am on the coursepack search page$/) do
  visit '/search'
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end