class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :image, :about, :address, :birthday, :city, :facebook, :name, :phone,
    :sex, :twitter, :website, :work, :user_id

  has_attached_file :image, :styles => {
    :medium => "230x230#",
    :member => "160x160#",
    :small => "100x100#",
    :thumb => "50x50#"
  }, :default_url => '/assets/missing/:class/:style/missing.png'
  
  def sex_enum
    [['Laki-laki', 'male'], ['Perempuan', 'female']]
  end
end
