Given /there is an admin account/ do 
  u = User.create!( :username => "admin", :email => "admin", :password => "NACLAadmin")
  u.admin = true
  u.save
end


When /I log in as admin/ do
  page.fill_in 'username', :with => 'admin'
	page.fill_in 'password', :with => 'NACLAadmin'
	click_button 'Sign In'
end
  
When /the admin account has a coursepack with title "(.*)" and summary "(.*)"/ do |title, summary|
  CoursePack.create(title: title, summary: summary, user_id: User.find_by_username('admin').id)
end
   
When /I edit the "(.*)" course pack/ do |title|
  click_on title
  click_on 'Edit'
end
   
Then /I should see extra admin functionality/ do
  page.should have_unchecked_field 'Featured'
end

When /I mark the coursepack to be featured/ do
  check 'Featured'
  click_on 'Update'
end

Then /the coursepack should be featured on the home page/ do
  within 'div#featured_container' do
    page.should have_content 'Test'
  end
end

Then /I should not see an option to feature the coursepack/ do
  click_on "COURSE PACKS"
  click_on "Test"
  click_on "Edit"
  page.should_not have_unchecked_field 'Featured' and page.should_not have_checked_field 'Featured'
  page.should have_unchecked_field 'Public'
end

When /I confirm/ do
  page.driver.browser.switch_to.alert.accept
end
  
