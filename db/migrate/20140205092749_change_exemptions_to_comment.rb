class ChangeExemptionsToComment < ActiveRecord::Migration
  def up
    rename_column :bills, :exemptions, :comment
  end

  def down
    rename_column :bills, :comment, :exemptions
  end
end
