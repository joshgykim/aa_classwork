class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :rating, null: false
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false
      t.timestamps
    end
  end
  def self.up
     execute "ALTER TABLE reviews ADD CONSTRAINT check_rating CHECK (rating IN (1, 2, 3, 4, 5) )"
  end
  def self.down
    execute "ALTER TABLE reviews DROP CONSTRAINT check_rating"
  end
end
