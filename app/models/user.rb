class User < ActiveRecord::Base
  include RoleModel

#  has_many :why_sumbars
  has_many :tourism_articles
  has_many :events
  has_many :folktales
  has_many :tips_tricks
  has_many :location_tourisms
  has_many :comments

  before_save :set_default_roles

  def set_default_roles
    self.roles = :member if roles.blank?
  end

  def roles_enum
    self.class.valid_roles.map do |role|
      [role.to_s.humanize, role]
    end
  end
    
  validates :username, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  validates :password_confirmation, :presence => true, :if => :password

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  default_fields = [:username, :email, :password, :password_confirmation, :remember_me, :login, :image]
  attr_accessible *default_fields
  attr_accessible *(default_fields + [:roles, as: :admin])
  # attr_accessible :title, :body
  
  has_attached_file :image, :styles => {
    :medium => "300x300#",
    :small => "100x100#",
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

end
