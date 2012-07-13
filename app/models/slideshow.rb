class Slideshow < ActiveRecord::Base
  attr_accessible :description, :state, :title, :image

  has_attached_file :image, :styles => {
    :normal => "1200x500#",
    :thumb => "145x75#"
  }

  state_machine :initial => :unpublished do
    before_transition all => all do |slideshow, transition|
      slideshow.is_authorized_for?(transition)
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
  scope :recent, order("created_at desc")
  
  def state_enum
    #Published / Unpublished is Display
    #published / unpublished save to database
    [['Published', 'published'], ['Unpublished', 'unpublished']]
  end

  def is_authorized_for?(transition)
    permitted_to?(transition.event.to_sym)
  end
  
end
