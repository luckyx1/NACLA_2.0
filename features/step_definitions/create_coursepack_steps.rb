Given (/^the following documents exist:$/) do |course_pack_table|
  course_pack_table.hashes.each do |course|
    CoursePack.create!(course)
  end
end