class User < ActiveRecord::Base
  include RoleModel

  has_many :comments
  has_many :deletion_requests
  has_many :events
  has_many :event_revisions
  has_many :folktales
  has_many :folktale_revisions
  has_many :likes
  has_many :location_tourisms
  has_many :location_tourism_revisions
  has_one  :profile, :autosave => true
  has_many :reviews, class_name: 'Comment', conditions: "commentable_type = 'LocationTourism'"
  has_many :sumbar_contents
  has_many :tips_tricks
  has_many :tips_trick_revisions
  has_many :tourism_articles
  has_many :tourism_article_revisions

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  
  attr_accessible :state, :username, :email, :password, :password_confirmation, :remember_me, :login, :roles

  validates :username,
    :presence => true,
    :uniqueness => true,
    :length => {:maximum => 15},
    :format => {:with => /^[A-Za-z\d_]+$/}

  validates :email,
    :presence => true,
    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :password_confirmation, :presence => true, :if => :password

  default_scope :include => :profile
  scope :recent, order("created_at desc")

  before_save :set_default_roles

  #handle data profile
  delegate :about, to: :profile, allow_nil: true
  delegate :address, to: :profile, allow_nil: true
  delegate :birthday, to: :profile, allow_nil: true
  delegate :city, to: :profile, allow_nil: true
  delegate :facebook, to: :profile, allow_nil: true
  delegate :name, to: :profile, allow_nil: true
  delegate :work, to: :profile, allow_nil: true
  delegate :phone, to: :profile, allow_nil: true
  delegate :sex, to: :profile, allow_nil: true
  delegate :twitter, to: :profile, allow_nil: true
  delegate :website, to: :profile, allow_nil: true
  delegate :image, to: :profile, allow_nil: true

  def set_default_roles
    self.roles = :member if roles.blank?
  end

  def roles_enum
    self.class.valid_roles.map do |role|
      [role.to_s.humanize, role]
    end
  end

  after_initialize do
    self.profile ||= self.build_profile
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  roles_attribute :roles_mask

  roles :admin, :operator, :member

  valid_roles.map do |role|
    scope role, where("roles_mask & :role = :role", role: mask_for(role))
  end

  state_machine :initial => :enabled do
    before_transition all => all do |user, transition|
      user.is_authorized_for?(transition)
    end
    event :enable do
      transition all - [:enabled] => :enabled
    end

    event :disable do
      transition all - [:disabled] => :disabled
    end
    state :disabled
    state :enabled
  end

  scope :enabled, where(state: :enabled)
  scope :disabled, where(state: :disabled)

  def state_enum
    #Enabled / Disabled is Display
    #enabled / disabled save to database
    [['Enabled', 'enabled'], ['Disabled', 'disabled']]
  end

  def active_for_authentication?
    super && enabled?
  end

  def inactive_message
    if !enabled?
      :disabled
    else
      super
    end
  end

end
