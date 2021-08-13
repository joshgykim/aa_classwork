# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

    has_one :cart,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cart

    has_many :restaurants,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :Restaurant

    has_many :reviews,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Review

    has_many :reviewed_restaurants,
    through: :reviews,
    source: :restaurant

    has_many :owned_restaurant_reviews,
    through: :restaurants,
    source: :reviews

    has_many :dishes_in_cart,
    through: :cart,
    source: :dishes

end
