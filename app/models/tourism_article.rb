class TourismArticle < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :deletion_requests, as: :item, dependent: :destroy

  # sebelum di rails s, di comment dulu. Setelah rails s selesai, aktifkan lagi yang di comment
  is_impressionable

  attr_accessible :state, :content, :title, :video, :image, :user_id, as: [:default] + User.valid_roles
  has_attached_file :image, :styles => { 
    :large => "740x380#",
    :medium => "340x180#",
    :tiny => "240x180#",
    :small => "100x100#",
    :thumb => "145x75#"
  }

  validates :title, :content, presence: true

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
