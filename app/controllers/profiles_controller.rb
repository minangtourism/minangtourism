class ProfilesController < ApplicationController

  skip_before_filter :authenticate_user!, 
    only: [:reviews, :folktales, :tourism_articles, :location_tourisms, :events, :tips_tricks]
  load_and_authorize_resource :class => 'User'

  def index
    #    @profiles =
    @members = User.member.page(params[:page]).per(20)
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
    @tourism_articles   = @profile.tourism_articles.published.recent.limit(3)
    @folktales          = @profile.folktales.published.recent.limit(3)
    @location_tourisms  = @profile.location_tourisms.published.recent.limit(3)
    @events             = @profile.events.published.recent.limit(3)
    @tips_tricks        = @profile.tips_tricks.published.recent.limit(3)
    @reviews            = @profile.reviews.published.recent.limit(5)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
