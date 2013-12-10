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
   
When /I visit the coursepack "(.*)"/ do |title|
  click_on title
end
   
Then /I should see extra admin functionality/ do

end
