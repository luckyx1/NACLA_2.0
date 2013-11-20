class ArticlesController < ApplicationController
  def show
  	@article = Article.find(params[:id])
  end

  def download
  	redirect_to Article.find(params[:id]).download_link
  end
end
