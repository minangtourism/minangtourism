class LocationTourism < ActiveRecord::Base

  belongs_to :user
  belongs_to :location_tourism_revision
  belongs_to :category_loc_tourism
  has_many :comments, as: :commentable

  attr_accessible :address, :state, :access_state, :category_loc_tourism_id, :category_tourism_id,
    :city, :description, :facebook, :facility, :hours_description,
    :name, :phone, :twitter, :user_id, :web, :zip, :image

  has_attached_file :image, :styles => { 
    :normal => "560x280#",
    :medium => "230x230#",
    :small => "240x180#",
    :thumb => "160x120#"
  }
  
  #Validation
  validates_format_of :name, :presence => true, :uniqueness => true, 
    :with => /^[^0-9`!@#\$%\^&*+_=]+$/,
    :message => "Hanya boleh huruf dan angka"
  
  validates :address, :presence => true
  
  validates_format_of :zip,
    :with => %r{\d{5}(-\d{4})?},
    :allow_blank => true,
    :allow_nil => true,
    :message => "kode pos sumbar = 25111 - 27779"

  validates_format_of :phone,
    :with => /\A[0-9]{5}\Z/,
    :allow_blank => true,
    :allow_nil => true,
    :message => "hanya boleh angka 0-9, minimal 5 digit"

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
