class Event < ActiveRecord::Base

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  is_impressionable
  
  attr_accessible  :state, :description, :title, :user_id, :image, :start_date, :end_date

  #search
  define_index do
    indexes title, :as => :title, :sortable => true

    has created_at, updated_at
  end
  
  has_attached_file :image, :styles => {
    :large => "740x380#",
    :medium => "340x180#",
    :tiny => "240x180#",
    :small => "100x100#",
    :thumb => "145x75#"
  }

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true

  scope :recent, order("created_at desc")

  state_machine :initial => :unpublished do
    before_transition all => all do |event, transition|
      event.is_authorized_for?(transition)
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
