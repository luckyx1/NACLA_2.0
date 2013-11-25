class Article < ActiveRecord::Base
  attr_accessible :description, :publication_date, :tags, :title, :thumbnail_link, :volume, :issue, :download_link
  has_and_belongs_to_many :course_packs


=begin
  def self.search_categories
  	%w(title description tags)
  end

  def self.selected_articles(id_list)
    if id_list.nil?
      return []
    else
      #selected = []
      #id_list.each do |id|
      selected = Article.all
      #end
      return selected
    end
  end
=end

end
