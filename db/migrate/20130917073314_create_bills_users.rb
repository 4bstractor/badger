class CreateBillsUsers < ActiveRecord::Migration
  def up
    create_table :bills_users, :id => false do |t|
      t.references :user
      t.references :bill
    end
  end

  def down
    drop_table :bills_users
  end
end
