class HomesController < ApplicationController
  def index
    @tourism_articles = TourismArticle.order("created_at desc").page(params[:page]).per(3)
    @folktales = Folktale.order("created_at desc").page(params[:page]).per(5)
    @tips_tricks = TipsTrick.order("created_at desc").page(params[:page]).per(5)
    @events = Event.order("created_at desc").page(params[:page]).per(3)
    @reviews = Comment.reviews.order("created_at desc").page(params[:page]).per(4)
  end
end
