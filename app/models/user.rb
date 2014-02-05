class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password

  validates_presence_of :email
  validates_presence_of :password, :on => :create

  has_and_belongs_to_many :entities
  has_and_belongs_to_many :bills

  after_create :create_personal_entity

  def total_bills_value
    entities.collect(&:total_value).sum.signif(2)
  end

  private

  def create_personal_entity
    # Overwrites any existing entities just to make sure
    personal_entity = Entity.create!(:name => "Personal")
    self.entities = [personal_entity]
  end
end
