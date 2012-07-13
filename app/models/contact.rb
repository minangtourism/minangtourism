class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone

  validates :email, :message, :name, :presence => true
end
