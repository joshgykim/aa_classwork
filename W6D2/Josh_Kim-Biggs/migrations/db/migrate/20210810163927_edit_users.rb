class EditUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passkey, :password
    remove_column :users, :favorite_cuisine
  end
end