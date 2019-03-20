class AddColumnPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :mod_id, :integer
    add_foreign_key :posts, :mods
  end
end
