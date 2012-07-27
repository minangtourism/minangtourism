class TourismArticlesController < ApplicationController
  load_and_authorize_resource
  impressionist
  
  def index
    @tourism_articles = @tourism_articles.published.recent.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tourism_articles }
    end
  end

  def search
    @search = TourismArticle.published.search(params[:search], :order => :created_at, :sort_mode => :desc)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tourism_articles }
    end
  end

  def show
    @comments = @tourism_article.comments.published.recent.page(params[:page]).per(10)
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tourism_article }
    end
  end

  def create_comment
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @tourism_article

    if @comment.save
      redirect_to @tourism_article, notice: 'Komentar sukses dibuat, menunggu verifikasi admin'
    else
      #       render action: "show"
      redirect_to @tourism_article, notice: 'Komentar gagal dibuat, form komentar kosong'
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tourism_article }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @tourism_article.save
        format.html { redirect_to @tourism_article, notice: 'Tourism article was successfully created.' }
        format.json { render json: @tourism_article, status: :created, location: @tourism_article }
      else
        format.html { render action: "new" }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tourism_article.update_attributes(params[:tourism_article])
        redirect_to @tourism_article, notice: "Tourism article was successfully updated. #{undo_link}"
      else
        format.html { render action: "edit" }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tourism_article.destroy

    respond_to do |format|
      format.html { redirect_to tourism_articles_url }
      format.json { head :no_content }
    end
  end

  private

end
