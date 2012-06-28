class ReviewsController < ApplicationController
  def index
    @reviews = Comment.reviews.order("created_at desc").accessible_by(current_ability)
  end
end
