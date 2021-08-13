# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :integer          not null
#  dish_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord
    validates :cart_id, :dish_id, presence: true

    belongs_to :cart,
    primary_key: :id,
    foreign_key: :cart_id,
    class_name: :Cart

    belongs_to :dish,
    primary_key: :id,
    foreign_key: :dish_id,
    class_name: :Dish

end
