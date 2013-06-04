class Bill < ActiveRecord::Base
  validates :source, :presence => true
  validates :amount_in_cents, :presence => true, :numericality => true
  validates :recurring, :presence => true
  validates :due_date, :presence => true

  belongs_to :entity

  def amount
    amount_in_cents / 100 if amount_in_cents
  end

  def amount=(new_amount)
    # Convert a dollar amount into cents for integer storage
    write_attribute(:amount_in_cents, new_amount.to_f * 100) if new_amount
  end
end
