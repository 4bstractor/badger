class Bill < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :entity

  has_and_belongs_to_many :users

  RECUR_OPTIONS = ["annually", "quarterly", "tri-monthly", "bi-monthly", "monthly", "tri-weekly", "bi-weekly", "weekly", "one-time"]

  def info_string
    "#{adjusted_amount} (#{amount.to_s}) #{recur_period} on #{due_string}"
  end

  def due_string
    due_date.to_formatted_s(:long_ordinal)
  end

  def adjusted_amount
    (amount.to_f / users.count).signif(2)
  end
end
