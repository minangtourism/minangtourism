class HomesController < ApplicationController
  def index
    #    @tourism_articles = TourismArticle.order("created_at desc").page(params[:page]).per(3)
    @tourism_articles = TourismArticle.published.recent.page(params[:page]).per(3)
    
    #    @folktales = Folktale.order("created_at desc").page(params[:page]).per(5)
    @folktales = Folktale.published.recent.page(params[:page]).per(5)
    
    #    @events = Event.order("created_at desc").page(params[:page]).per(3)
    @events = Event.published.recent.page(params[:page]).per(3)

    #    @tips_tricks = TipsTrick.order("created_at desc").page(params[:page]).per(5)
    @tips_tricks = TipsTrick.published.recent.page(params[:page]).per(5)

    #    @reviews = Comment.reviews.order("created_at desc").page(params[:page]).per(4)
    @reviews = Comment.reviews.recent.published.page(params[:page]).per(4)
  end
end
