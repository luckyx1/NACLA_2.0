Given /I have coursepack "(.*)" with article(s?) "(.*)"/ do |pack, s, arts|
  articles = arts.split('" and "')
  @coursepack = CoursePack.new(title: pack, summary: pack)
  @coursepack.user_id = 1
  @coursepack.save!
  articles.each {|art| @coursepack.articles << Article.find_by_title(art)}
end


Given /I am on my user profile page/ do
  click_on 'PROFILE'
end

When /I fill out "(.*)" with "(.*)"/ do |field, text|
  page.fill_in field, :with => text
end

Then /I should see coursepacks "(.*)"/ do |packs|
  coursepacks = packs.split('", "')
  coursepacks.each {|pack| page.should have_content pack}
end

Then /I should see title "(.*)"/ do |title|
  page.should have_content title
end

When /I should see article "(.*)"/ do |article|
  page.should have_content article
end

But /I should not see title "(.*)"/ do |title|
  page.should_not have_content title
end

Then /I should not have changed my password/ do
  page.should have_content 'Edit Profile'
end

Then /I should be on my profile page/ do
  page.should_not have_content 'Edit Profile'
  page.should have_content 'Welcome, '
end
  
When /I am on "(.*)" course pack page/ do |name|
  click_on name
end
