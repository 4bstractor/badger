class Entity < ActiveRecord::Base
  validates :name, :presence => true

  has_and_belongs_to_many :users

  has_many :bills

  def bills_summary
    " : #{bills.count} " + 'Bill'.pluralize(bills.count)
  end

  def formatted_address
    address ? "@#{address}" : "No Address"
  end
  
  # Currency methods
  def total_value
    # zero prevents upstream errors resulting from integer return
    (bills.collect(&:adjusted_amount) + [0.0]).sum.signif(2)
  end
end
