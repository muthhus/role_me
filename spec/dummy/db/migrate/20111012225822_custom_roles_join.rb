class CustomRolesJoin < ActiveRecord::Migration
  def up
    create_table :custom_roles_join, :id => false do |t|
      t.integer :roled_id
      t.integer :role_id
    end
    add_index :custom_roles_join, [:roled_id, :role_id], :name => "Customjoin"
  end

  def down
    drop_table :custom_roles_join
  end
end
