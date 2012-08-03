class Comment < ActiveRecord::Base

  belongs_to :location_tourism_revision
  belongs_to :tourism_article_revision
  belongs_to :user

  acts_as_commentable

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  attr_accessible :state, :comment, :user_id

  define_index do
    indexes comment, :as => :comment, :sortable => true

    has created_at, updated_at
  end
  
  validates :comment, :presence => true

  state_machine initial: :unpublished do
    event :publish do
      transition :unpublished => :published
    end

    event :unpublish do
      transition :published => :unpublished
    end

    state :published
    state :unpublished
  end

  scope :reviews, where(commentable_type: 'LocationTourism')
  scope :published, where(state: "published")
  scope :recent, order("created_at DESC")
  scope :unpublished, where(state: "unpublished")

  def state_enum
    self.class.state_machine.states.map do |state|
      [state.name.to_s.humanize, state.value]
    end.sort
  end
  
end
