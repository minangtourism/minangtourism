class LocationTourism < ActiveRecord::Base

  belongs_to :user
  belongs_to :category_loc_tourism

  attr_accessible :address, :category_loc_tourism_id, :category_tourism_id,
    :city, :description, :facebook, :facility, :hours_description,
    :name, :phone, :twitter, :user_id, :web, :zip, :image, as: [:default] + User.valid_roles

  has_attached_file :image, :styles => { 
    :medium => "300x300#",
    :small => "100x100#",
    :thumb => "50x50#"
  }

  validates :name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  #  validates :zip, :presence => true
  #  validates :phone, :presence => true
  #  validates :web, :presence => true
  #  validates :web, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  #  validates :facebook, :presence => true
  #  validates :facebook, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  #  validates :twitter, :presence => true
  #  validates :twitter, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :hours_description, :presence => true
  validates :facility, :presence => true
  #  validates :Description, :presence => true
end
