class CategoryLocTourism < ActiveRecord::Base

  acts_as_nested_set

  has_many :location_tourisms
  has_many :location_tourism_revisions

  attr_accessible :name, :parent_id, :lft, :rgt

  validates :name, :presence => true

end
