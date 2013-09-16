class CreateEntitiesUsers < ActiveRecord::Migration
  def up
    create_table :entities_users, :id => false do |t|
      t.references :user
      t.references :entity
    end
  end

  def down
    drop_table :entities_users
  end
end
