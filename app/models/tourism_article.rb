class TourismArticle < ActiveRecord::Base

  belongs_to :user
  has_many :comments, as: :commentable

  # sebelum di rails s, di comment dulu. Setelah rails s selesai, aktifkan lagi yang di comment
  is_impressionable

  attr_accessible :content, :title, :video, :image, :user_id, as: [:default] + User.valid_roles
  has_attached_file :image, :styles => { 
    :large => "740x380#",
    :medium => "340x180#",
    :tiny => "240x180#",
    :small => "100x100#",
    :thumb => "145x75#"
  }

  validates :title, :content, :presence => true

  scope :recent, order("created_at desc")
end
