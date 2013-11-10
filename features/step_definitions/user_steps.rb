Given /I am on the home page/ do
	visit ('/')	
end

When /I press "(.*)"/ do |link|
	click_link(link)
end

When (/I fill out valid registration information/) do 
	page.fill_in 'username', :with => 'Alex'
	page.fill_in 'email', :with => 'test@test.com'
	page.fill_in 'password', :with => 'password'
	page.fill_in 'password_confirmation', :with => 'password'
	click 'Create new account'
end


#testing each situation i.e. unique username, email, matching passwords etc is TDD
When /I fill out invalid registration information/ do 
	page.fill_in 'password', :with => 'pass'
	page.fill_in 'password_confirmation', :with => 'password'
	click 'Create new account'	
end

Then /I should have my own account/ do 
	page.has_content? 'You have created an account.'
end

Then /I should not have my own account/ do
	page.has_no_content? 'You have created an account.'
end

Given /I have an account/ do
	page.fill_in 'username', :with => 'Alex'
	page.fill_in 'email', :with => 'test@test.com'
	page.fill_in 'password', :with => 'password'
	page.fill_in 'password_confirmation', :with => 'password'
	click 'Create new account'
	visit ('/')
end

When /I fill out correct account information/ do 
	page.fill_in 'username', :with => 'Alex'
	page.fill_in 'password', :with => 'password'
	click 'Log in'
end

When /I fill out incorrect account information/ do
	page.fill_in 'username', :with => 'Alex'
	page.fill_in 'password', :with => 'pass'
	click 'Log in'
end

When /I am logged out/ do
	click 'Log out'
end

#might need one for Then as well?
When /I am logged in/ do
	page.has_content? 'Logged in as test@test.com'
end

Then /I should not be logged into my account'/ do 
	page.has_no_content? 'Logged in as test@test.com'
end

When /I am on the "(.*)" page/ do |page|
	visit '/'
	click page
end

When /I create a new course pack named "(.*)"/ do |name|
	page.fill_in 'title', :with => "#{name}"
	click_button 'Create'
end

Then /"(.*)" should be added to my account/ do |course_pack|
	visit '/'
	page.has_content? 'Title: Test'
end

When /I am on the "(.*)" course pack page/ do |name|
	visit '/'
	within_table "#{name}" do
		click 'Show'
	end
end

Then /I should be able to write "(.*)" to "(.*)"/ do |comment, course_pack|
	page.fill_in 'comment', with => "#{comment}" 
	click 'Add comment'
	page.has_content? "#{comment}"	
end

When /I should get to try again/ do 
	page.has_content? 'Try again.'
end

