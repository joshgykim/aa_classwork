# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  body          :text             not null
#  rating        :integer          not null
#  user_id       :integer          not null
#  restaurant_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Review < ApplicationRecord

    belongs_to :reviewer,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    belongs_to :restaurant,
    primary_key: :id,
    foreign_key: :restaurant_id,
    class_name: :Restaurant

end
