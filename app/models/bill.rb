class Bill < ActiveRecord::Base
  attr_accessible :name, :amount, :recur_period, :due_date, :comment, :entity_id, :exemptions_attributes, :users

  belongs_to :entity
  has_many :exemptions, :dependent => :destroy
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :exemptions, :allow_destroy => true, :reject_if => lambda { |a| a[:user_id].blank? }

  validates_presence_of :amount, :name, :recur_period, :entity_id
  validates_presence_of :due_date, :unless => Proc.new { |a| a.recur_period == "one-time" }
  validates_numericality_of :amount, :greater_than => 0.01, :less_than => 99999.99

  RECUR_OPTIONS = ["annually", "quarterly", "tri-monthly", "bi-monthly", "monthly", "tri-weekly", "bi-weekly", "weekly", "one-time"]

  def info_string
    "#{adjusted_amount.signif(2)} (#{amount.signif(2)}) #{recur_period} #{"on #{due_date_to_long_ordinal}" if due_date}"
  end

  def due_date_to_long_ordinal
    due_date.to_formatted_s(:long_ordinal)
  end

  def adjusted_amount
    amount.quo(BigDecimal.new(users.count))
  end
end
