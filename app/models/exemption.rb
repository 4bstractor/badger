class Exemption < ActiveRecord::Base
  attr_accessible :amount, :bill, :expiration_date, :expire, :percentage, :subtract, :user
end
