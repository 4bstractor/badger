class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password

  validates_presence_of :email
  validates_presence_of :password, :on => :create

  belongs_to :entity
end
