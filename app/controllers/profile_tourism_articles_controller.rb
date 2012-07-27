class ProfileTourismArticlesController < ApplicationController
  load_and_authorize_resource :profile, :class => "User"
  load_and_authorize_resource :tourism_article, through: :profile, :class => "TourismArticle", parent: false
  before_filter :prepare_tourism_article_revision, only: [:edit, :update]

  layout "profile"

  def index
    @tourism_articles = @tourism_articles.recent.published.page(params[:page]).per(10)
    @new_tourism_article = @profile.tourism_articles.new
  end
  
  def new
  end

  def create
    respond_to do |format|
      if @tourism_article.save
        format.html { redirect_to profile_tourism_articles_url(@profile), notice: 'Berita Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tourism_article, status: :created, location: @tourism_article }
      else
        format.html { render action: "new" }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tourism_article_revision.save
        format.html { redirect_to profile_tourism_articles_url(@profile), notice: 'Berita Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tourism_article_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    deletion_request = current_user.deletion_requests.create(item: @tourism_article)

    respond_to do |format|
      if deletion_request.errors.blank?
        format.html { redirect_to profile_tourism_articles_url(@profile), notice: 'Permohonan penghapusan Berita Wisata berhasil dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tourism_article, status: :created, location: @tourism_article }
      else
        format.html { redirect_to request.referer || profile_tourism_articles_url(@profile), alert: 'Permohonan penghapusan sebelumnya pada Berita Wisata yang sama masih menunggu verifikasi admin' }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def prepare_tourism_article_revision
    @tourism_article_revision = current_user.tourism_article_revisions.new
    @tourism_article_revision.tourism_article = @tourism_article
    @tourism_article_revision.copy_fields
    @tourism_article_revision.attributes = params[:tourism_article]
  end
end
