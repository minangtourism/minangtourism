class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone

  #Validation
  validates_format_of :name, :presence => true, :uniqueness => true,
    :with => /^[^0-9`!@#\$%\^&*+_=]+$/,
    :message => "Hanya boleh huruf"

  validates_format_of :phone,
    :with => /\A\S[0-9\+\/\(\)\s\-]*\z/i,
    :allow_blank => true,
    :allow_nil => true,
    :message => "hanya boleh angka"

  validates :email,
    :presence => true,
    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  validates :message, :presence => true

end
