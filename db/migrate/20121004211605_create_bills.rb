class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :source
      t.integer :amount
      t.boolean :recurring
      t.integer :recur_period
      t.date :due_date

      t.timestamps
    end
  end
end
