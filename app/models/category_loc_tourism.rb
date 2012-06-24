class CategoryLocTourism < ActiveRecord::Base

  acts_as_nested_set

  has_many :location_tourisms

  attr_accessible :name, :parent_id, :lft, :rgt, as: [:default] + User.valid_roles

end
