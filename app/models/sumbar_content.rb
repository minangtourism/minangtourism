class SumbarContent < ActiveRecord::Base
  belongs_to :user
  
  #  attr_accessible :content, :title, :type, :user_id, :image
  default_fields = [:content, :title, :type, :user_id, :image]
  attr_accessible *default_fields
  attr_accessible *(default_fields + [:roles, as: :admin])

  has_attached_file :image, :styles => {
    :large => "740x380#",
    :medium => "360x260#",
    :tiny => "260x180#",
    :small => "160x120#",
    :thumb => "145x75#"
  }
end
