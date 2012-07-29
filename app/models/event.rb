class Event < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :deletion_requests, as: :item, dependent: :destroy
  has_many :revisions, class_name: "EventRevision", dependent: :destroy
  belongs_to :user
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

  #Validation
  validates_format_of :title, :presence => true, :uniqueness => true,
    :with => /^[^`!@#\$%\^&*+_=]+$/,
    :message => "Hanya boleh huruf dan angka"
  
  validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true

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