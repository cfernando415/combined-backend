class AddReferencesLikes < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :likes, :users
    add_foreign_key :likes, :posts
  end
end
