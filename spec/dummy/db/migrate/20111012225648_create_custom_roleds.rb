class CreateCustomRoleds < ActiveRecord::Migration
  def change
    create_table :custom_roleds do |t|

      t.timestamps
    end
  end
end
