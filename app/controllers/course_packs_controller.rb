class CoursePacksController < ApplicationController
  # GET /course_packs
  # GET /course_packs.json

  def index
    @course_packs = CoursePack.all
    session[:title] = nil
    session[:selected_article_ids] = nil
    session[:search_article_ids] = nil
    session[:summary] = nil

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_packs }
    end
  end

  # GET /course_packs/1
  # GET /course_packs/1.json
  def show
    @course_pack = CoursePack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course_pack }
    end
  end

  # GET /course_packs/new
  # GET /course_packs/new.json
  def new
   @selected_article_ids = []
   @search_article_ids = []
   @title = ""
   @summary = ''
   @course_pack_articles = []
   @search_articles = nil
   @count = Article.count
   @search_categories = Article.search_categories




   #update session or set params to session for selected ids

     if not params[:selected_article_ids].blank?
       session[:selected_article_ids] = params[:selected_article_ids]
       @selected_article_ids = (@selected_article_ids << session[:selected_article_ids]).flatten
     elsif not session[:selected_article_ids].blank?
       redirect_to new_course_pack_path(selected_article_ids:session[:selected_article_ids],
                                        search_article_ids:session[:search_article_ids],# || params[:search_article_ids],
                                        title:session[:title],
                                        summary:session[:summary],
                                        q:params[:q],
                                        category:params[:category],
                                        new_article:params[:new_article])
       return
    end


   #update for search article ids
     if not params[:search_article_ids].blank?
       session[:search_article_ids] = params[:search_article_ids]
       @search_article_ids = (@search_article_ids << session[:search_article_ids]).flatten
     elsif not session[:search_article_ids].blank?
       redirect_to new_course_pack_path(selected_article_ids:session[:selected_article_ids],
                                        search_article_ids:session[:search_article_ids],
                                        title:session[:title],
                                        summary:session[:summary],
                                        q:params[:q],
                                        category:params[:category],
                                        new_article:params[:new_article])
       return
    end

   #if new article, add article to ids
   if params[:new_article]
    @selected_article_ids << params[:new_article]
   end

   @selected_article_ids.each do |id|
     @course_pack_articles << Article.find(id)
   end

   if not params[:q].blank? and params[:category]
     @search_articles = view_context.search_articles(params[:category], params[:q])
     #@search_articles = Article.all
   elsif @search_article_ids == "all" or @search_article_ids == ['all']
     @search_articles = Article.all
  end



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course_pack }
    end
  end

  # GET /course_packs/1/edit
  def edit
    @course_pack = CoursePack.find(params[:id])
  end

  # POST /course_packs
  # POST /course_packs.json
  def create
    @course_pack = CoursePack.new(params[:course_pack])

    respond_to do |format|
      if @course_pack.save
        format.html { redirect_to @course_pack, notice: 'Course pack was successfully created.' }
        format.json { render json: @course_pack, status: :created, location: @course_pack }
      else
        format.html { render action: "new" }
        format.json { render json: @course_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /course_packs/1
  # PUT /course_packs/1.json
  def update
    @course_pack = CoursePack.find(params[:id])

    respond_to do |format|
      if @course_pack.update_attributes(params[:course_pack])
        format.html { redirect_to @course_pack, notice: 'Course pack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_packs/1
  # DELETE /course_packs/1.json
  def destroy
    @course_pack = CoursePack.find(params[:id])
    @course_pack.destroy

    respond_to do |format|
      format.html { redirect_to course_packs_url }
      format.json { head :no_content }
    end
  end

  def list_all
    redirect_to new_course_pack_path(search_article_ids:'all', selected_article_ids:params[:selected_article_ids])
  end

  def add_article
    redirect_to new_course_pack_path(selected_article_ids:params[:selected_article_ids],new_article:params[:new_article])
  end
end
