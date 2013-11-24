module SearchHelper

	def search_articles(category, search_term)	
		# define search logic here
		Article.where(category + ' LIKE ?', "%#{search_term}%")
	end

end
