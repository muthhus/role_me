class CreateRoleMeRoles < ActiveRecord::Migration
  def change
    create_table :role_me_roles do |t|

      t.timestamps
    end
  end
end
