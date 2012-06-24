class SumbarContent < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :content, :title, :type, :user_id
end
