class LocationTourism < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :deletion_requests, as: :item, dependent: :destroy
  has_many :revisions, class_name: "LocationTourismRevision", dependent: :destroy
  belongs_to :updater, class_name: 'User'
  belongs_to :category_loc_tourism
  belongs_to :user

  is_impressionable
  
  attr_accessible :address, :state, :access_state, :category_loc_tourism_id,
    :city, :description, :facebook, :facility, :hours_description,
    :name, :phone, :twitter, :user_id, :web, :zip, :image, :updater_id

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

#  validates_format_of :phone,
#    :with => /\A[0-9]{15}\Z/,
#    :allow_blank => true,
#    :allow_nil => true,
#    :message => "hanya boleh angka 0-9, minimal 5 digit"

  state_machine initial: :unpublished do
    event :publish do
      transition :unpublished => :published
    end

    event :unpublish do
      transition :published => :unpublished
    end

    state :published
    state :unpublished
  end

  scope :published, where(state: "published")
  scope :recent, order("created_at DESC")
  scope :unpublished, where(state: "unpublished")

  def state_enum
    self.class.state_machine.states.map do |state|
      [state.name.to_s.humanize, state.value]
    end.sort
  end
end
