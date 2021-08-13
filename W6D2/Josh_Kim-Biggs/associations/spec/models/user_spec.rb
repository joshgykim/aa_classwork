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

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.find_by_username("randy") }

  it "is associated with a cart" do
    expect(user.cart.user_id).to eq(user.id)
  end

  it "is associated with reviews" do
    expect(user.reviews.first.rating).to eq(1)
  end

  it "is associated with restaurants" do
    expect(user.restaurants.first.name).to eq("Bobandys Burgers")
  end

  it "is associated with reviewed restaurants" do
    expect(user.reviewed_restaurants.first.name).to eq("McRonalds")
  end

  it "is associated with reviews of their restaurant" do
    expect(user.owned_restaurant_reviews.first.rating).to eq(5)
  end

  it "is associated with dishes in their cart" do
    expect(user.dishes_in_cart.first.name).to eq("Burrito Burger")
  end
  
end
