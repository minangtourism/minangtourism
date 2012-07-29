class Slideshow < ActiveRecord::Base
  attr_accessible :description, :state, :title, :image

  has_attached_file :image, :styles => {
    :normal => "1200x500#",
    :thumb => "145x75#"
  }

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

  scope :published, where(state: "published")
  scope :recent, order("created_at DESC")
  scope :unpublished, where(state: "unpublished")

  def state_enum
    self.class.state_machine.states.map do |state|
      [state.name.to_s.humanize, state.value]
    end.sort
  end
  
end
