class Comment < ActiveRecord::Base

  belongs_to :user

  acts_as_commentable

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  attr_accessible :title, :comment, as: [:default] + User.valid_roles

  validates :comment, :presence => true

  scope :reviews, where(commentable_type: 'LocationTourism')

  scope :recent, order("created_at desc")
  
  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  
end
