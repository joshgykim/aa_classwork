class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :rating, null: false
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false
      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :restaurant_id
  end
end
