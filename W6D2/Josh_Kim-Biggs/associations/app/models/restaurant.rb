# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#

class Restaurant < ApplicationRecord
    validates :owner_id, presence: true
  
    has_many :dishes,
    primary_key: :id,
    foreign_key: :restaurant_id,
    class_name: :Dish

    belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :User

    has_many :reviews,
    primary_key: :id,
    foreign_key: :restaurant_id,
    class_name: :Review

    has_many :customers_reviewed,
    through: :reviews,
    source: :reviewer

end
