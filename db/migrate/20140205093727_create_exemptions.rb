class CreateExemptions < ActiveRecord::Migration
  def change
    create_table :exemptions do |t|
      t.references :user
      t.references :bill
      t.boolean :percentage
      t.boolean :subtract
      t.decimal :amount, :precision => 8, :scale => 2
      t.boolean :expire
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
