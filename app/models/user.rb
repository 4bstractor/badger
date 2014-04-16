class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password

  validates_presence_of :email
  validates_presence_of :password, :on => :create

  has_many :exemptions
  has_and_belongs_to_many :entities
  has_and_belongs_to_many :bills

  after_create :create_personal_entity

  def total_bills_value
    BigDecimal(entities.collect(&:total_value).sum).signif(2)
  end

  def bills_overview
    "You have #{bills.count} #{'bill'.pluralize(bills.count)} belonging to #{entities.count} #{'entity'.pluralize(entities.count)}"
  end
  
  # Scope to find a user by either identifier
  def self.find_by_identifier(identifier)
    where("username = ? OR email = ?", identifier, identifier).first
  end

  private

  def create_personal_entity
    # Overwrites any existing entities just to make sure
    personal_entity = Entity.create!(:name => "Personal")
    self.entities = [personal_entity]
  end
end
