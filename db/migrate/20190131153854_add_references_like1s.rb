class AddReferencesLike1s < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :like1s, :coupons
    add_foreign_key :like1s, :members
  end
end
