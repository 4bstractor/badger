class Exemption < ActiveRecord::Base
  attr_accessible :amount, :bill, :expiration_date, :expire, :percentage, :subtract, :user_id

  belongs_to :user
  belongs_to :bill

  validates_presence_of :amount, :bill_id, :user_id, :percentage, :subtract, :expire
  validates_presence_of :expiration_date, :if => Proc.new { |a| a.expire? }
  validates_numericality_of :amount, :greater_than_or_equal_to => 0.00, :less_than => 10000.00

  def summary
    "#{user.username} pays #{amount.signif(2)}#{percentage ? '%' : '$'} #{subtract ? 'less' : 'more'} #{"on #{long_ordinal_date}" if expire}"
  end

  def long_ordinal_date
    expiration_date.to_formatted_s(:long_ordinal)
  end
end
