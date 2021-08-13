# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
    validates :user_id, presence: true

    has_many :cart_items,
    primary_key: :id,
    foreign_key: :cart_id,
    class_name: :CartItem

    belongs_to :customer,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    has_many :dishes,
    through: :cart_items,
    source: :dish
end
