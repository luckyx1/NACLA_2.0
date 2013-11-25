When(/^I select "(.*?)" for coursepack "(.*?)"$/) do |val, funt|
	click_link val
end

Then(/^I should the "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I add article "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I edit "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I tap on "(.*?)"$/) do |val|
	click_link	val
end


Then(/^I should be on the "(.*?)" page$/) do |loc|
	visit "/"+loc.to_s
end

