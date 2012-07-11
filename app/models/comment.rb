class Comment < ActiveRecord::Base

  belongs_to :user

  acts_as_commentable

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  attr_accessible :state, :comment, as: [:default] + User.valid_roles

  define_index do
    indexes comment, :as => :comment, :sortable => true

    has created_at, updated_at
  end
  
  validates :comment, :presence => true

  scope :reviews, where(commentable_type: 'LocationTourism')

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  scope :recent, order("created_at desc")

  state_machine :initial => :unpublished do
    before_transition all => all do |comment, transition|
      comment.is_authorized_for?(transition)
    end
    event :publish do
      transition :unpublished => :published
    end
    event :unpublish do
      transition :published => :unpublished
    end
    state :unpublished
    state :published
  end

  scope :published, where(:state => 'published')
  scope :unpublished, where(:state => 'unpublished')

  def state_enum
    ['published','unpublished']
  end

  def is_authorized_for?(transition)
    permitted_to?(transition.event.to_sym)
  end
  
end
