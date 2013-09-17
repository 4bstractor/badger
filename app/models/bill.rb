class Bill < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :entity

  def info_string
    "#{amount.to_s} #{recur_period} on the #{due_date}"
  end
end
