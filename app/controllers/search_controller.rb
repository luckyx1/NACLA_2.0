class SearchController < ApplicationController

	def index
		@count = Document.count
		@search_categories = Document.search_categories
		@documents = nil

		if params[:commit] == "List All"
			@documents = Document.all
		elsif params[:q] and params[:category]
			@documents = Document.where(params[:category] => params[:q])
		end

	end
end
