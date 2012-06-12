class TipsTrick < ActiveRecord::Base

  belongs_to :user

  attr_accessible :description, :title, :user_id, :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :title, :presence => true
  validates :description, :presence => true

end
