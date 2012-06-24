class Comment < ActiveRecord::Base

  belongs_to :user

  acts_as_commentable

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  attr_accessible :title, :comment, as: [:default] + User.valid_roles

  default_scope :order => 'created_at ASC'

  validates :comment, :presence => true

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  
end
