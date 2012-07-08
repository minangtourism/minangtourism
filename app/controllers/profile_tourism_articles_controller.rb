class ProfileTourismArticlesController < ApplicationController
  load_and_authorize_resource :profile, :class => "User"
  load_and_authorize_resource :tourism_article, through: :profile, :class => "TourismArticle", parent: false

  layout "profile"

  def create
    respond_to do |format|
      if @tourism_article.save
        format.html { redirect_to profile_tourism_articles_url(@profile), notice: 'Berita Wisata was successfully created. Menunggu verifikasi admin' }
        format.json { render json: @tourism_article, status: :created, location: @tourism_article }
      else
        format.html { render action: "new" }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tourism_article.destroy

    respond_to do |format|
      format.html { redirect_to profile_tourism_articles_url(@profile) }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def index
    @tourism_articles = @tourism_articles.recent.page(params[:page]).per(10)
  end

  def new
  end

  def update
    respond_to do |format|
      if @tourism_article.update_attributes(params[:tourism_article])
        format.html { redirect_to profile_tourism_articles_url(@profile), notice: 'Berita Wisata was successfully updated. Menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end
end
