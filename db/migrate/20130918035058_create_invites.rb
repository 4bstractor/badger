class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user, :null => false
      t.references :inviter, :null => false
      t.references :bill, :null => false
      t.boolean :expired, :null => false, :default => false
      t.timestamps
    end
  end
end
