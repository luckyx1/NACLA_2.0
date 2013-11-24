class SearchController < ApplicationController

	def index
		@count = Article.count
		@search_categories = Article.search_categories
		@articles = nil

		if params[:commit] == "List All"
			@articles = Article.all
		elsif params[:q] and params[:category]
			@articles = view_context.search_articles(params[:category], params[:q])
		end

	end
end
