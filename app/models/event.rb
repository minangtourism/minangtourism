class Event < ActiveRecord::Base

  belongs_to :user
  has_many :comments, as: :commentable

  attr_accessible  :description, :title, :user_id, :image, :start_date, :end_date
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
end
