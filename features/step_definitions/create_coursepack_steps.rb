Given /the following movies exist/ do |course_pack_table|
  course_pack_table.hashes.each do |course|
    Course_pack.create!(course)
  end
end