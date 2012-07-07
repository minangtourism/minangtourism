class TourismArticle < ActiveRecord::Base
  has_paper_trail only: [:title, :content]

  belongs_to :user
  has_many :comments, as: :commentable

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

  validates :title, :content, :presence => true

  scope :recent, order("created_at desc")

  state_machine :initial => :unpublished do
    # before_transition all => all do |tourism_article, transition|
    #   tourism_article.is_authorized_for?(transition)
    # end
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

  #  def is_authorized_for?(transition)
  #    permitted_to?(transition.event.to_sym)
  #  end
end
