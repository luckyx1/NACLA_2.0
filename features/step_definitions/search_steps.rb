Given(/^the following exists in the database:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |article|
  	Article.create(article)
  end
end
