class Entity < ActiveRecord::Base
  validates :name, :presence => true

  has_and_belongs_to_many :users

  has_many :bills

  # Maybe this should be a helper method
  def info_string
    "#{bill_string}#{address_string}" 
  end

  def bill_string
    " : #{bills.count} Bill#{"s" unless bills.count == 1}"
  end
  
  def address_string
    " : #{address}" if address
  end

  # Currency methods
  def total_value
    # zero prevents upstream errors resulting from integer return
    (bills.collect(&:adjusted_amount) + [0.0]).sum.signif(2)
  end
end
