class AddIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :cart_items, :cart_id
    add_index :cart_items, :dish_id
    add_index :carts, :user_id, unique: true
    add_index :dishes, :restaurant_id
    add_index :restaurants, :owner_id
    add_index :reviews, :user_id
    add_index :reviews, :restaurant_id
    add_index :users, :username, unique: true
  end
end
