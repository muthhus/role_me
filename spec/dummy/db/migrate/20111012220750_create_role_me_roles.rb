class CreateRoleMeRoles < ActiveRecord::Migration
  def change
    create_table :role_me_roles do |t|
      t.string :name
      t.timestamps
    end
    add_index :role_me_roles, [:name], :unique => true
  end
end
