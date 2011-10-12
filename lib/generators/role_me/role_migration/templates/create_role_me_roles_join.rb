class CreateRoleMeRoles < ActiveRecord::Migration
  def change
    create_table :role_me_roles_join, :id => false do |t|
      t.integer :roled_id
      t.integer :role_id
      t.timestamps
    end
    add_index :role_me_roles, [:roled_id, :role_id], :unique => true, :name => "roled_roles"
  end
end
