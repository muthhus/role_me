class CreateCustomRoles < ActiveRecord::Migration
  def change
    create_table :custom_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
