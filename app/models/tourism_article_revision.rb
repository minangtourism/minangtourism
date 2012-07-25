class TourismArticleRevision < ActiveRecord::Base
  attr_accessible :content, :state, :title, :tourism_article_id, :user_id
end
