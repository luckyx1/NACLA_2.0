class CoursePacksController < ApplicationController

  before_filter :require_login

  def index
    @user = current_user
    @course_packs = CoursePack.find_all_by_user_id(current_user.id) || []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_packs }
    end
  end

  def show
    show_or_edit('show')
  end

  def new
    @user = current_user
    respond_to do |format|
      format.html { render "new"}
      format.json { render json: @course_pack }
    end
  end


  def edit
    show_or_edit('edit')
  end

  def create
    if request.xhr?
          @course_pack = CoursePack.new(title:params[:title],summary:params[:summary])
          @course_pack.user = User.find_by_id(params[:user_id])

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
    else
      redirect_to '/'
    end

  end

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


  def destroy
    @course_pack = CoursePack.find(params[:id])
    @course_pack.destroy

    respond_to do |format|
      format.html { redirect_to course_packs_url }
      format.json { head :no_content }
    end
  end


  def search
    respond_to do |format|
      format.html{redirect_to '/'}
      format.json {
        @course_pack = CoursePack.all
        render json: @course_pack
      }
    end

  end

  private

  def require_login
    if current_user.nil?
      redirect_to('/log_in')
    end
  end

  def show_or_edit(call_from)
    @course_pack = CoursePack.where(id:params[:id],user_id:current_user.id).first
    unless @course_pack.blank?
      @articles = []
      #create list of articles in json format
      @course_pack.articles.each do |article|
        @articles << article.to_json
      end
      @course_pack = @course_pack.to_json
      if call_from == 'show'
        render 'show'
      else
        render 'edit'
      end
    else
      redirect_to '/course_packs'
    end

  end

end
