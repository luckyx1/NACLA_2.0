Given(/^the following comments exits:$/) do |table|
  # table is a Cucumber::Ast::Table

  table.hashes.each do |comment|
  	Comment.create(comment)
  end
end

Given(/^I am on the comments front page$/) do
  visit '/comments?'
end

