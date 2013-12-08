class ArticlesController < ApplicationController
  def show
  	@article = Article.find(params[:id])
  end

  def download
  	if current_user
      params[:id] = params[:id].to_i > 2 ? '1' : params[:id]
      send_file "#{Rails.root}/files/#{params[:id]}.pdf", :type=>"application/pdf"
    else
      redirect_to '/'
    end
  end

  def search
    @user = current_user
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
