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

  has_attached_file :image, :styles => {
    :large => "740x500#",  # # dipaksa, > kl ukurannya lebih akan di sesuaikan
    :medium => "340x180#",
    :tiny => "240x180#",
    :small => "100x100#",
    :thumb => "145x75#"
  }
  
  state_machine :initial => :unpublished do
    before_transition :unpublished => :published, :do => :apply_revision
    event :publish do
      transition :unpublished => :published
    end
    event :unpublish do
      transition :published => :unpublished
    end
    state :unpublished
    state :published
  end

  scope :published, where(state: "published")
  scope :recent, order("created_at DESC")
  scope :unpublished, where(state: "unpublished")

  def state_enum
    self.class.state_machine.states.map do |state|
      [state.name.to_s.humanize, state.value]
    end.sort
  end

  def copy_fields
    target = tourism_article
    self.title = target.title
    self.content = target.content
    self.image_file_name = target.image_file_name
    self.image_content_type = target.image_content_type
    self.image_file_size = target.image_file_size
    self.image_updated_at = target.image_updated_at
  end

  def apply_revision
    target = tourism_article
    target.title = title
    target.content = content
    target.image_file_name = image_file_name
    target.image_content_type = image_content_type
    target.image_file_size = image_file_size
    target.image_updated_at = image_updated_at
    target.save
  end
end
