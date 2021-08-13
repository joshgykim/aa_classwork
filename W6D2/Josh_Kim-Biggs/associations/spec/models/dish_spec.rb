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

require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject(:dish) { Dish.first }

  it "is associated with a restaurant" do
    expect(dish.restaurant.name).to eq("Bobandys Burgers")
  end

  it "is associated with cart items" do
    expect(dish.cart_items.first.dish_id).to eq(dish.id)
  end

  describe "validations" do
    it "require dish to be associated with a restaurant" do
      is_expected.to validate_presence_of(:restaurant).with_message(/must exist/)
    end
  end
end
