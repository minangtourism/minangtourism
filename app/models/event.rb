class Event < ActiveRecord::Base

  belongs_to :user
  has_many :comments, as: :commentable

  attr_accessible  :description, :title, :user_id, :image, :start_date, :end_date, as: [:default] + User.valid_roles
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
end
