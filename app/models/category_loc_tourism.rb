class CategoryLocTourism < ActiveRecord::Base

  acts_as_nested_set

  has_many :tourism_locations
  has_many :tourism_location_revisions

  attr_accessible :name, :parent_id, :lft, :rgt

  validates :name, :presence => true

end
