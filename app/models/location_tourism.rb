class LocationTourism < ActiveRecord::Base

  belongs_to :user
  belongs_to :category_loc_tourism
  has_many :comments, as: :commentable

  attr_accessible :address, :state, :access_state, :category_loc_tourism_id, :category_tourism_id,
    :city, :description, :facebook, :facility, :hours_description,
    :name, :phone, :twitter, :user_id, :web, :zip, :image

  has_attached_file :image, :styles => { 
    :medium => "560x280#",
    :small => "240x180#",
    :thumb => "160x120#"
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

  scope :recent, order("created_at desc")

  state_machine :initial => :unpublished do
    before_transition all => all do |location_tourism, transition|
      location_tourism.is_authorized_for?(transition)
    end
    event :publish do
      transition :unpublished => :published
    end
    event :unpublish do
      transition :published => :unpublished
    end
    state :unpublished
    state :published
  end

  scope :published, where(:state => 'published')
  scope :unpublished, where(:state => 'unpublished')

  def state_enum
    ['published','unpublished']
  end

  def is_authorized_for?(transition)
    permitted_to?(transition.event.to_sym)
  end
end
