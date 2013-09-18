class AddExemptionsToBills < ActiveRecord::Migration
  def change
    add_column :bills, :exemptions, :string
  end
end
