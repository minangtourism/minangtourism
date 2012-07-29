class EventRevision < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :deletion_requests, as: :item, dependent: :destroy
  belongs_to :event
  has_many :likes, as: :likeable
  belongs_to :user

  is_impressionable

  attr_accessible :description, :event_id, :end_date, :event_id, :image, :start_date, :state, :title, :user_id

  has_attached_file :image

  #Validation
  validates_format_of :title, :presence => true, :uniqueness => true,
    :with => /^[^`!@#\$%\^&*+_=]+$/,
    :message => "Hanya boleh huruf dan angka"

  validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true

  state_machine :initial => :pending do
    before_transition any - :approved => :approved, :do => :apply_revision
    event :approve do
      transition :pending => :approved
    end
    event :reject do
      transition :pending => :rejected
    end
    state :approved
    state :pending
    state :rejected
  end

  scope :approved, where(state: "approved")
  scope :pending, where(state: "pending")
  scope :recent, order("created_at DESC")
  scope :rejected, where(state: "rejected")

  def state_enum
    self.class.state_machine.states.map do |state|
      [state.name.to_s.humanize, state.value]
    end.sort
  end

  def copy_fields
    target = event
    self.title = target.title
    self.description = target.description
    self.start_date = target.start_date
    self.end_date = target.end_date
  end

  def apply_revision
    target = event
    target.title = title
    target.description = description
    target.start_date = start_date
    target.end_date = end_date
    target.image = image if image?
    target.save
  end
end
