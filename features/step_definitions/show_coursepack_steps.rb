When(/^I select the button "(.*?)" for coursepack "(.*?)"$/) do |val, funt|
	click_button val
end

When(/^I select the link "(.*?)" for coursepack "(.*?)"$/) do |val, funt|
  click_link("show_link")
end

When(/^I add article "(.*?)"$/) do |arg1|
 click_button('add_article')
end

When(/^I edit "(.*?)" with "(.*?)"$/) do |field, value|
  page.fill_in  field.downcase.to_str, :with => " "
end

When(/^I tap on "(.*?)"$/) do |val|
	click_on	val
end


Then(/^I should be on the "(.*?)" page$/) do |loc|
	visit "/"+loc.to_s
end

