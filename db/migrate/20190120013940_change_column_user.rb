class ChangeColumnUser < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :users, :password, :password_digest
  end
  def self.down
  end
end
