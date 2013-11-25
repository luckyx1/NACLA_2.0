When(/^I select "(.*?)" for coursepack "(.*?)"$/) do |val, funt|
	click_link val
end


When(/^I add article "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I edit "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in  field.downcase.to_str, :with => nil
end

When(/^I tap on "(.*?)"$/) do |val|
	click_link	val
end


Then(/^I should be on the "(.*?)" page$/) do |loc|
	visit "/"+loc.to_s
end

