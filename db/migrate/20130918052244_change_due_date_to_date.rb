class ChangeDueDateToDate < ActiveRecord::Migration
  def up
    remove_column :bills, :due_date
    add_column :bills, :due_date, :datetime
  end

  def down
    remove_column :bills, :due_date
    add_column :bills, :due_date, :string
  end
end
