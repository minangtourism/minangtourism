class ProfilesController < ApplicationController

  skip_before_filter :authenticate_user!, 
    only: [:abouts, :reviews, :folktales, :tourism_articles, :location_tourisms, :events, :tips_tricks,
    :new_tourism_article, :create_tourism_article,
    :new_folktale, :create_folktale,
    :new_location_tourism, :create_location_tourism,
    :new_tips_tricks, :create_tips_tricks,
    :new_event, :create_event
  ]
  load_and_authorize_resource :class => 'User'
  before_filter :load_tourism_article, only: [
    :edit_tourism_article, :update_tourism_article, :destroy_tourism_article ]

  def index
    @profiles = @profiles.member.recent.page(params[:page]).per(20)
  end

  def abouts
  end

  def reviews
    @reviews = @profile.reviews.published.recent.page(params[:page]).per(10)
  end

  def folktales
    @folktales = @profile.folktales.published.recent.page(params[:page]).per(10)
  end

  def tourism_articles
    @tourism_articles = @profile.tourism_articles.published.recent.page(params[:page]).per(10)
  end

  def location_tourisms
    @location_tourisms = @profile.location_tourisms.published.recent.page(params[:page]).per(10)
  end

  def events
    @events = @profile.events.published.recent.page(params[:page]).per(10)
  end

  def tips_tricks
    @tips_tricks = @profile.tips_tricks.published.recent.page(params[:page]).per(10)
  end

  def show
    @tourism_articles   = @profile.tourism_articles.published.recent.limit(2)
    @folktales          = @profile.folktales.published.recent.limit(2)
    @location_tourisms  = @profile.location_tourisms.published.recent.limit(2)
    @events             = @profile.events.published.recent.limit(2)
    @tips_tricks        = @profile.tips_tricks.published.recent.limit(2)
    @reviews            = @profile.reviews.published.recent.limit(7)
  end

  #TOURISM ARTICLE
  def new_tourism_article
    @tourism_article = current_user.tourism_articles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tourism_article }
    end
  end

  def create_tourism_article
    @tourism_article = current_user.tourism_articles.new(params[:tourism_article])

    respond_to do |format|
      if @tourism_article.save
        format.html { redirect_to tourism_articles_profile_url(@profile), notice: 'Berita Wisata telah sukses dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tourism_article, status: :created, location: @tourism_article }
      else
        format.html { render action: "new_tourism_article" }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_tourism_article
  end

  def update_tourism_article
    respond_to do |format|
      if @tourism_article.update_attributes(params[:tourism_article])
        format.html { redirect_to tourism_articles_profile_url(@profile), notice: 'Berita Wisata was successfully updated. Menunggu verifikasi admin' }
        format.json { head :no_content }
      else
        format.html { render action: "edit_tourism_article" }
        format.json { render json: @tourism_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_tourism_article
    @tourism_article.destroy

    respond_to do |format|
      format.html { redirect_to tourism_articles_profile_url(@profile) }
      format.json { head :no_content }
    end
  end

  #FOLKTALE
  def new_folktale
    @folktale = current_user.folktales.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folktale }
    end
  end

  def create_folktale
    @folktale = current_user.folktales.new(params[:folktale])

    respond_to do |format|
      if @folktale.save
        format.html { redirect_to folktales_profile_url(@profile), notice: 'Cerita rakyat telah suskses dibuat. Menunggu verifikasi admin' }
        format.json { render json: @folktale, status: :created, location: @folktale }
      else
        format.html { render action: "new_folktale" }
        format.json { render json: @folktale.errors, status: :unprocessable_entity }
      end
    end
  end

  #EVENT
  def new_event
    @event = current_user.events.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  def create_event
    @event = current_user.events.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_profile_url(@profile), notice: 'Acara wisata telah suskses dibuat. Menunggu verifikasi admin' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new_event" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  #LOCATION TOURISM
  def new_location_tourism
    @location_tourism = current_user.location_tourisms.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_tourism }
    end
  end

  def create_location_tourism
    @location_tourism = current_user.location_tourisms.new(params[:location_tourism])

    respond_to do |format|
      if @location_tourism.save
        format.html { redirect_to location_tourisms_profile_url(@profile), notice: 'Lokasi Wisata telah suskses dibuat. Menunggu verifikasi admin' }
        format.json { render json: @location_tourism, status: :created, location: @location_tourism }
      else
        format.html { render action: "new_location_tourism" }
        format.json { render json: @location_tourism.errors, status: :unprocessable_entity }
      end
    end
  end

  #TIPS & TRICK
  def new_tips_trick
    @tips_trick = current_user.tips_tricks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tips_trick }
    end
  end

  def create_tips_trick
    @tips_trick = current_user.tips_tricks.new(params[:tips_trick])

    respond_to do |format|
      if @tips_trick.save
        format.html { redirect_to tips_tricks_profile_url(@profile), notice: 'Tips & Trick Wisata telah suskses dibuat. Menunggu verifikasi admin' }
        format.json { render json: @tips_trick, status: :created, location: @tips_trick }
      else
        format.html { render action: "new_tips_trick" }
        format.json { render json: @tips_trick.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_about
  end

  def update_about
    respond_to do |format|
      if @profile.profile.update_attributes(params[:profile])
        format.html { redirect_to abouts_profile_url(@profile), notice: 'Profil telah sukses diperbaharui.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit_about" }
        format.json { render json: @profile.profile.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def load_tourism_article
    @tourism_article = @profile.tourism_articles.find(params[:tourism_article_id])
  end

end
