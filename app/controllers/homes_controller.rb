class HomesController < ApplicationController
  def index
    @tourism_articles = TourismArticle.published.recent.page(params[:page]).per(3)
    @folktales = Folktale.published.recent.page(params[:page]).per(5)
    @events = Event.published.recent.page(params[:page]).per(3)
    @tips_tricks = TipsTrick.published.recent.page(params[:page]).per(5)
    @tourism_locations = TourismLocation.published.recent.page(params[:page]).per(1)
    @reviews = Comment.reviews.recent.published.page(params[:page]).per(4)
    @slideshows = Slideshow.recent.published.page(params[:page])
  end

  def search
    @search_article   = TourismArticle.published.search(params[:search], :order => :created_at, :sort_mode => :desc)
    @search_folktale  = Folktale.published.search(params[:search], :order => :created_at, :sort_mode => :desc)
    @search_event     = Event.published.search(params[:search], :order => :created_at, :sort_mode => :desc)
    @search_trick     = TipsTrick.published.search(params[:search], :order => :created_at, :sort_mode => :desc)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @homes }
    end
  end
end
