When(/^I choose "(.*?)"$/) do |field|
  choose(field)
end

Then(/^I expect to see "(.*?)" before "(.*?)"$/) do |e1, e2|
  assert page.body.index(/#{e1}/) < page.body.index(/#{e2}/)
end

