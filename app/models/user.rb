class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password

  validates_presence_of :email
  validates_presence_of :password, :on => :create

  has_and_belongs_to_many :entities

  after_create :create_personal_entity

  private

  def create_personal_entity
    # Overwrites any existing entities just to make sure
    personal_entity = Entity.create!(:name => "#{self.id}")
    self.entities = [personal_entity]
  end
end
