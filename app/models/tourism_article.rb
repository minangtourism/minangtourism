class TourismArticle < ActiveRecord::Base

  belongs_to :user

  attr_accessible :content, :title, :video, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :title, :presence => true
  validates :content, :presence => true
end
