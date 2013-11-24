class ArticlesController < ApplicationController
  def show
  	@article = Article.find(params[:id])
  end

  def download
  	redirect_to Article.find(params[:id]).download_link
  end

  def search
    @article_count = Article.count
    @pack_count = CoursePack.count
    respond_to do |format|
      format.html{render 'index'}
      format.json{
        @articles = Article.all
        render :json => @articles 
      }
    end
  end

end
