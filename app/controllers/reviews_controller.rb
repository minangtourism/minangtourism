class ReviewsController < ApplicationController
  def index
    @reviews = Comment.reviews.order("created_at desc").page(params[:page]).per(10).accessible_by(current_ability)
  end
end
