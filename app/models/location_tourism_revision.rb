class LocationTourismRevision < ActiveRecord::Base
  belongs_to :user
  belongs_to :category_loc_tourism
  belongs_to :location_tourism
  has_many :comments, as: :commentable

  attr_accessible :image, :address, :category_loc_tourism_id, :city,
    :description, :facebook, :facility, :hours_description, :name,
    :phone, :location_tourism_id, :state, :twitter,
    :user_id, :web, :zip

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

  state_machine :initial => :unpublished do
    before_transition :unpublished => :published, :do => :apply_revision
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

#  def is_authorized_for?(transition)
#    permitted_to?(transition.event.to_sym)
#  end

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
    self.image_file_name = target.image_file_name
    self.image_content_type = target.image_content_type
    self.image_file_size = target.image_file_size
    self.image_updated_at = target.image_updated_at
    
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
    target.image_file_name = image_file_name
    target.image_content_type = image_content_type
    target.image_file_size = image_file_size
    target.image_updated_at = image_updated_at
    target.save
  end

end
