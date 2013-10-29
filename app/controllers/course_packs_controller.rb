class CoursePacksController < ApplicationController
  # GET /course_packs
  # GET /course_packs.json
  def index
    @course_packs = CoursePack.all

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
    @course_pack = CoursePack.new
    @count = Article.count
    @search_categories = Article.search_categories
    @articles = nil

    if params[:selected_articles]

    end
    @selected_articles = []

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
end
