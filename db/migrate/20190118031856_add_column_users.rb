class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mod_id, :integer
    add_foreign_key :users, :mods
  end
end
