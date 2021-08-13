class ChangeRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :owner_id, :integer
  end
end
