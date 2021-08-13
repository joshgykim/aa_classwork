class EditRestaurant < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :location, :address
    add_index :restaurants, :owner_id
  end
end
