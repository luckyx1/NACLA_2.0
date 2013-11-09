Given /I am on the home page/ do
	visit ('/')	
end

When /I press (.*)/ do |link|
	click_link(link)
end

#uniqueness of username and email, passwords are same, and ensures all fields are filled out
When (/I fill out valid registration information/) do 
	fill_in 'username', :with => 'Alex'
	fill_in 'email', :with => 'test@test.com'
	fill_in 'password', :with => 'password'
	fill_in 'password_confirmation', :with => 'password'
	click 'Create new account'
end

#figure out how to dry this with above
When /I fill out invalid registration information/ do 

end

Then /I should have my own account/ do 
	page.has_content? 'You have created an account.'
end

Given /I have an account/ do
	fill_in 'username', :with => 'Alex'
	fill_in 'email', :with => 'test@test.com'
	fill_in 'password', :with => 'password'
	fill_in 'password_confirmation', :with => 'password'
	click 'Create new account'
	visit ('/')
end

When /I fill out correct account information/ do 
	fill_in 'username', :with => 'Alex'
	fill_in 'password', :with => 'password'
	click 'Log in'
end

#dry this out with above as well
When /I fill out incorrect account information/ do

end

#might need one for Then as well?
When /I am logged in/ do
	page.has_content? 'Logged in as
end

When /I am on the "(.*)" page/ do |page|

end

When /I create a new course pack named "(.*)"/ do |name|

end

Then /"(.*)" should be added to my account/ do |course_pack|

end

Then /I should be able to write "(.*)" to "(.*)"/ do |comment, course_pack|

end

When /I should get to try again/ do 

end

