class ReviewsController < ApplicationController
  def index
    @reviews = Comment.reviews.published.recent.page(params[:page]).per(10)
  end
end
