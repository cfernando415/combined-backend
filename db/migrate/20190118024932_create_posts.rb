class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content, :length => 140

      t.timestamps
    end
  end
end
