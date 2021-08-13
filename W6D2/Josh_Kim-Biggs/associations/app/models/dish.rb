# == Schema Information
#
# Table name: dishes
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  description   :text             not null
#  restaurant_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Dish < ApplicationRecord
    validates :restaurant_id, presence: true

    has_many :cart_items,
    primary_key: :id,
    foreign_key: :dish_id,
    class_name: :CartItem

    belongs_to :restaurant,
    primary_key: :id,
    foreign_key: :restaurant_id,
    class_name: :Restaurant
  
end
