class SearchController < ApplicationController

	def index
		@count = Document.count
		@search_categories = Document.search_categories
		@documents = Document.where(:title => "sdasdasfgsed")
	end
end
