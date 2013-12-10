Then /"(.*)" should be deleted/ do |title|
  page.should_not have_content title
end
