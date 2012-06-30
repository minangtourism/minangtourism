class User < ActiveRecord::Base
  include RoleModel

  #  has_many :why_sumbars
  has_many :tourism_articles
  has_many :events
  has_many :folktales
  has_many :tips_tricks
  has_many :location_tourisms
  has_many :comments
  has_many :sumbar_contents
  has_many :reviews, class_name: 'Comment', conditions: "commentable_type = 'LocationTourism'"

  before_save :set_default_roles

  def set_default_roles
    self.roles = :member if roles.blank?
  end

  def roles_enum
    self.class.valid_roles.map do |role|
      [role.to_s.humanize, role]
    end
  end
    
  validates :username, :presence => true, :uniqueness => true, :length => { :maximum => 30 }
  validates :password_confirmation, :presence => true, :if => :password

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  default_fields = [:state, :username, :email, :password, :password_confirmation, :remember_me, :login, :image]
  attr_accessible *default_fields
  attr_accessible *(default_fields + [:roles, as: :admin])
  # attr_accessible :title, :body
  
  has_attached_file :image, :styles => {
    :medium => "230x230#",
    :member => "160x160#",
    :small => "100x100#",
    :member_thumb => "50x50#",
    :thumb => "50x50#"
  }, :default_url => '/assets/missing/:class/:style/missing.png'
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  # Role Model
  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  roles_attribute :roles_mask

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
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

end
