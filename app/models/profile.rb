class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :about, :address, :birthday, :city, :facebook, :name, :phone,
    :sex, :twitter, :website, :user_id, as: [:default] + User.valid_roles

  def sex_enum
    [['Laki-laki', 'male'], ['Perempuan', 'female']]
  end
end
