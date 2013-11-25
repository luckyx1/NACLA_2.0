Given(/^the following comments exits:$/) do |table|
  # table is a Cucumber::Ast::Table

  table.hashes.each do |comment|
  	Comment.create(comment)
  end
  
end

Given(/^the user "(.*?)" has an empty coursepack with title "(.*?)"$/) do |username, title|
  CoursePack.create(:title => title,
  									:summary => "Empty course pack.",
  									:user_id => User.find_by_username(username).id )
end

Given(/^the user "(.*?)" has a test comment on the coursepack "(.*?)"$/) do |username, title|
  Comment.create(	:comment => "Test comment for test course pack.", :user_id => User.find_by_username(username).id, :course_pack_id => CoursePack.find_by_title(title).id )
end

Given(/^I log out$/) do
  click_on "Log out"
end

Given(/^I go to the test coursepack show page$/) do
	coursepack_id = CoursePack.find_by_title("Comment Test").id
  visit "/course_packs/#{coursepack_id}"

end

Given(/^I type "(.*?)" into "(.*?)"$/) do |text, box|
  page.fill_in box, :with => text
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end






