class CoursePacksController < ApplicationController

  before_filter :require_login, except:[:search,:show]

  def index
    @user = current_user
    @course_packs = CoursePack.find_all_by_user_id(current_user.id) || []
    @course_packs.each do |coursepack|
      coursepack.summary = coursepack.summary[0...300] + '...' if coursepack.summary.length > 300
    end

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
    show_or_edit('new')
  end

  def create
    if request.xhr?
          @course_pack = CoursePack.new(title:params[:title],summary:params[:summary])
          @course_pack.user = User.find_by_id(params[:user_id])
          add_articles @course_pack

          render :nothing => true, :status=>:ok
          unless @course_pack.save
              render :status => :conflict
          end
    else
      redirect_to '/'
    end
  end

  def update
    @course_pack = CoursePack.find(params[:id])

    respond_to do |format|
      if @course_pack.update_attributes(params[:course_pack])
        format.html {
          @course_pack.articles = []
          add_articles(@course_pack)
          @course_pack.save
          redirect_to 'index', notice: 'Course pack was successfully updated.'
        }
      else
        format.html { render action: "edit" }
      end

    end
  end


  def destroy
    @course_pack = CoursePack.find(params[:id])
    comments = @course_pack.comments
    comments.each do |comment|
      comment.destroy
    end
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

  def show_or_edit(call_from)
    @user = current_user

    if call_from == 'show'
      @course_pack = CoursePack.find_by_id(params[:id])
    else
      @course_pack = CoursePack.where(id:params[:id],user_id:current_user.id).first
    end

    unless @course_pack.blank?
      @comments = create_comments(@course_pack).to_json
      @articles = []
      #create list of articles in json format
      @course_pack.articles.each do |article|
        @articles << article.to_json
      end

      @course_pack = @course_pack.to_json

      render call_from
    else
      redirect_to '/course_packs'
    end

  end

  def add_articles(course_pack)
    puts "add_articles"
     unless params[:article_ids].blank?
       params[:article_ids].each do |id|
         course_pack.articles << Article.find(id)
       end
     end
  end

  def create_comments(course_pack)
    comments = []
    course_pack.comments.each do |comment|
      user = comment.user.username
      comments << {user:user,comment:comment.comment}
    end
    return comments
  end

end
