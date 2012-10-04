class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :entity_id
      t.string :source, :null => false
      t.integer :amount_in_cents, :null => false
      t.boolean :recurring, :default => false, :null => false
      t.integer :recur_period
      t.date :due_date, :null => false

      t.timestamps
    end
  end
end
