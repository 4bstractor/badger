class Bill < ActiveRecord::Base
  validates :source, :presence => true
  validates :amount_in_cents, :presence => true, :numericality => true
  validates :recurring, :presence => true
  validates :due_date, :presence => true

  belongs_to :entity

  def amount
    amount_in_cents / 100 if amount_in_cents
  end
end
