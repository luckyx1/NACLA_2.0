class CoursePacksController < ApplicationController

  before_filter :require_login, except:[:search,:show]

  def index
    @user = current_user
    @course_packs = CoursePack.find_all_by_user_id(current_user.id) || []
    @course_packs = trim(@course_packs)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_packs }
    end
  end

  def show
    #flash[:notice] = params[:success] == 'true' ? 'Update successful' : ''
    coursePack = CoursePack.find(params[:id])
    if coursePack.public or current_user.id == coursePack.user_id or current_user.admin
      show_or_edit('show')
    else
      redirect_to('/')
    end
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
          @course_pack = CoursePack.new(params[:course_pack])
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
          render :nothing=>true, :status=>:ok
        }
      else
        flash[:error] = 'Update unsuccessful'
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
      flash[:notice] = params[:success] == 'true' ? 'Update successful' : ''
    else
      @course_pack = CoursePack.where(id:params[:id],user_id:current_user.id).first
    end

    unless @course_pack.blank?
      blank_course_pack(call_from)
    else
      redirect_to '/course_packs'
    end

  end

  private
  
  def blank_course_pack(call_from)
    @comments = create_comments(@course_pack).to_json
    @articles = setup_articles(@course_pack)
    @course_pack = @course_pack.to_json
    render call_from
  end

  def setup_articles(course_pack)
    articles = []
    course_pack.articles.each do |article|
      articles << article.to_json
    end
    return articles
  end

  def add_articles(course_pack)
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
