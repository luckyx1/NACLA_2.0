class Article < ActiveRecord::Base
  attr_accessible :description, :publication_date, :tags, :title

  def self.search_categories
  	%w(title description tags)
  end
end
