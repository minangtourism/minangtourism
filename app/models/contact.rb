class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone, as: [:default] + User.valid_roles

  validates :email, :message, :name, :presence => true
end
