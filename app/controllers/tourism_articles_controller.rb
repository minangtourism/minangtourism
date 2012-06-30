class TourismArticlesController < ApplicationController
  load_and_authorize_resource
  impressionist
  
  # GET /tourism_articles
  # GET /tourism_articles.json
  def index
    @tourism_articles = @tourism_articles.published.recent.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tourism_articles }
    end
  end

  # GET /tourism_articles/1
  # GET /tourism_articles/1.json
  def show
    @comments = @tourism_article.comments.recent.page(params[:page]).per(10)
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
      redirect_to @tourism_article
    else
      render action: "show"
    end
  end

  # GET /tourism_articles/new
  # GET /tourism_articles/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tourism_article }
    end
  end

  # GET /tourism_articles/1/edit
  def edit
  end

  # POST /tourism_articles
  # POST /tourism_articles.json
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

  # PUT /tourism_articles/1
  # PUT /tourism_articles/1.json
  def update
    respond_to do |format|
      if @tourism_article.update_attributes(params[:tourism_article])
        format.html { redirect_to @tourism_article, notice: 'Tourism article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tourism_articles/1
  # DELETE /tourism_articles/1.json
  def destroy
    #    @tourism_article = TourismArticle.find(params[:id])
    @tourism_article.destroy

    respond_to do |format|
      format.html { redirect_to tourism_articles_url }
      format.json { head :no_content }
    end
  end
end
