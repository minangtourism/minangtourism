class LocationTourismRevision < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :category_loc_tourism
  has_many :deletion_requests, as: :item, dependent: :destroy
  belongs_to :location_tourism
  belongs_to :user

  attr_accessible :image, :address, :category_loc_tourism_id, :city,
    :description, :facebook, :facility, :hours_description, :name,
    :phone, :location_tourism_id, :state, :twitter,
    :user_id, :web, :zip

  has_attached_file :image
  
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
#    :with => /\A[0-9]{5}\Z/,
#    :allow_blank => true,
#    :allow_nil => true,
#    :message => "hanya boleh angka 0-9, minimal 5 digit"

  state_machine :initial => :pending do
    before_transition any - :approved => :approved, :do => :apply_revision
    event :approve do
      transition :pending => :approved
    end
    event :reject do
      transition :pending => :rejected
    end
    state :approved
    state :pending
    state :rejected
  end

  scope :approved, where(state: "approved")
  scope :pending, where(state: "pending")
  scope :recent, order("created_at DESC")
  scope :rejected, where(state: "rejected")

  def state_enum
    self.class.state_machine.states.map do |state|
      [state.name.to_s.humanize, state.value]
    end.sort
  end

  def copy_fields
    target = location_tourism
    self.name = target.name
    self.category_loc_tourism_id = target.category_loc_tourism_id
    self.address = target.address
    self.city = target.city
    self.zip = target.zip
    self.phone = target.phone
    self.web = target.web
    self.facebook = target.facebook
    self.twitter = target.twitter
    self.hours_description = target.hours_description
    self.facility = target.facility
    self.description = target.description
  end

  def apply_revision
    target = location_tourism
    target.name = name
    target.category_loc_tourism_id = category_loc_tourism_id
    target.address = address
    target.city = city
    target.zip = zip
    target.phone = phone
    target.web = web
    target.facebook = facebook
    target.twitter = twitter
    target.hours_description = hours_description
    target.facility = facility
    target.description = description
    target.updater_id = user_id
    target.image = image if image?
    target.save
  end

end
