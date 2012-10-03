class Entity < ActiveRecord::Base
  validates :name, :presence => true

  has_many :users
end
