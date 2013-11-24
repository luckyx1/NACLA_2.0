Given /I am on the home page/ do
	visit ('/')	
end

When /I click on "(.*)"/ do |link|
	click_on(link)
end

When (/I fill out valid registration information/) do 
	page.fill_in 'user_username', :with => 'Alex'
	page.fill_in 'user_email', :with => 'test@test.com'
	page.fill_in 'user_password', :with => 'password'
	page.fill_in 'user_password_confirmation', :with => 'password'
	click_on('Create new account')
end

#testing each situation i.e. unique username, email, matching passwords etc is TDD
When /I fill out invalid registration information/ do 
	page.fill_in 'user_password', :with => 'pass'
	page.fill_in 'user_password_confirmation', :with => 'password'
	click_on 'Create new account'	
end

Then /I should have my own account/ do 
	page.should have_content 'You have created an account.'
end

Then /I should not have my own account/ do
	page.should_not have_content 'You have created an account.'
end

Given /I have an account/ do
  visit ('/sign_up')
	page.fill_in 'user_username', :with => 'Alex'
	page.fill_in 'user_email', :with => 'test@test.com'
	page.fill_in 'user_password', :with => 'password'
	page.fill_in 'user_password_confirmation', :with => 'password'
	click_on 'Create new account'
	visit ('/')
end

When /I fill out correct account information/ do 
	page.fill_in 'username', :with => 'Alex'
	page.fill_in 'password', :with => 'password'
	click_button 'Log in'
end

When /I fill out incorrect account information/ do
	page.fill_in 'username', :with => 'Alex'
	page.fill_in 'password', :with => 'pass'
	click_button 'Log in'
end

When /I am logged out/ do
	click_on 'Log out'
end

#might need one for Then as well?
When /I am logged in/ do
  	page.should have_content 'Logged in as test@test.com'
end

Then /I should not be logged into my account/ do 
	page.should_not have_content 'Logged in as test@test.com'
end

When /I am on the "(.*)" page/ do |page|
	visit '/'
	click_on page
end

When /I create a new course pack named "(.*)" with summary "(.*)"/ do |name, summary|
  click_on 'New Course pack'
	page.fill_in 'title', :with => name
	page.fill_in 'summary', :with => summary
	click_on 'Create'
	sleep 5
	puts page.body
end

Then /"(.*)" should be added to my account/ do |course_pack|
  page.should have_content 'Logged in as test@test.com'
  page.should have_content "Title: #{course_pack}"
end

When /I am on the "(.*)" course pack page/ do |name|
	visit '/course_packs'
	#find_by_id(name).click_on 'Show'
	#puts page.body
	page.should have_table name
end

Then /I should be able to write "(.*)" to "(.*)"/ do |comment, course_pack|
	page.fill_in 'comment', with => "#{comment}" 
	click_on 'Add comment'
	page.should have_content "#{comment}"	
end


