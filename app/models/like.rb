class Like < ActiveRecord::Base
  belongs_to :likeable, :polymorphic => true
  has_and_belongs_to_many :users
  
  attr_accessible :likeable_id, :likeable_type, :user_id

  scope :events, where(likeable_type: 'Event')
  validates_uniqueness_of :user_id, :scope => [:likeable_id, :likeable_type]

end
