class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.references :user
      t.references :entity
      t.string :name
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :recur_period
      t.string :due_date
      t.timestamps
    end
  end
end
