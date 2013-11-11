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
    respond_to do |format|
      format.html { render "new"}
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

    respond_to do |format|
        format.html { redirect_to '/'}
        format.json {
          @course_pack = CoursePack.new(title:params[:title],summary:params[:summary])

          if params[:article_ids]
            params[:article_ids].each do |id|
              @course_pack.articles << Article.find(id)
            end
          end

          if @course_pack.save
            render :nothing => true, :status => :ok
          else
            render :nothing => true, :status => :conflict
          end
        }
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

  def all_articles
    @articles = Article.all
    respond_to do |format|
      format.json {render json: @articles}
    end
  end

  def list_all
    redirect_to new_course_pack_path(search_article_ids:'all', selected_article_ids:params[:selected_article_ids])
  end

  def add_article
    redirect_to new_course_pack_path(selected_article_ids:params[:selected_article_ids],new_article:params[:new_article])
  end
end
