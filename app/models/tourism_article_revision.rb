class TourismArticleRevision < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :deletion_requests, as: :item, dependent: :destroy
  belongs_to :user
  belongs_to :tourism_article
  
  attr_accessible :image, :content, :state, :title, :tourism_article_id, :user_id

  #Validation
  validates_format_of :title, :presence => true, :uniqueness => true,
    :with => /^[^`!@#\$%\^&*+_=]+$/,
    :message => "Hanya boleh huruf dan angka"

  validates :content, :presence => true

#  has_attached_file :image, :styles => {
#    :large => "740x500#",  # # dipaksa, > kl ukurannya lebih akan di sesuaikan
#    :medium => "340x180#",
#    :tiny => "240x180#",
#    :small => "100x100#",
#    :thumb => "145x75#"
#  }
  has_attached_file :image
  
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
    target = tourism_article
    self.title = target.title
    self.content = target.content
  end

  def apply_revision
    target = tourism_article
    target.title = title
    target.content = content
    target.image = image if image?
    target.save
  end
end
