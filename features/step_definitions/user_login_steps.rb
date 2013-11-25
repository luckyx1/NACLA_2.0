Given /I have a user account with username "(.*)", password "(.*)", and email "(.*)"/ do |user, pass, email|
  visit ('/')
  click_on 'Register for an account'
	page.fill_in 'user_username', :with => user
	page.fill_in 'user_email', :with => email
	page.fill_in 'user_password', :with => pass
	page.fill_in 'user_password_confirmation', :with => pass
	click_on 'Create new account'
end

Given /I am logged in/ do
  if page.has_no_content? 'Log out'
    page.fill_in 'username', :with => 'Alex'
    page.fill_in 'password', :with => 'pass'
  end
end

Given /I am not logged in/ do
  if page.has_content? 'Log out'
    click_on 'Log out'
  end
end

When /I visit the "(.*)" page/ do |page|
  click_on page
end

Then /I should be asked to "(.*)"/ do |action|
  page.should have_content action
end

When /I login with username "(.*)" and password "(.*)"/ do |user, pass|
  #within("label#username") do
    #fill_in 'username', :with => user
    #fill_in 'password', :with => pass
  #end
  find("form[action='log_in']").fill_in "username" , :with => user
  find("form[action='log_in']").fill_in "password" , :with => pass
  click_button 'Log in'
  
end
