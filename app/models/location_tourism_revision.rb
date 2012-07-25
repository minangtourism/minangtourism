class LocationTourismRevision < ActiveRecord::Base
  has_many :location_tourisms

  attr_accessible :address, :category_loc_tourism_id, :city, :description, :facebook, :facility, :hours_description, :name, :phone, :revisiontable_id, :revisison_type, :state, :twitter, :user_id, :web, :zip
end
