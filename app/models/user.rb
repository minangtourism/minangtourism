class User < ActiveRecord::Base

  has_many :why_sumbars
  has_many :tourism_articles
  has_many :events
  has_many :folktales
  has_many :tips_tricks
  has_many :location_tourisms
  has_many :comments

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
