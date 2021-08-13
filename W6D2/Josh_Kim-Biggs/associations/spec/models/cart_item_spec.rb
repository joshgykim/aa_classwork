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

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  subject(:cart_item) { CartItem.first }

  it "is associated with a cart" do
    expect(cart_item.cart.id).to eq(cart_item.cart_id)
  end

  it "is associated with a dish" do
    expect(cart_item.dish.name).to eq("Burrito Burger")
  end

  describe "validations" do
    it "require cart item to be associated with a cart" do
      is_expected.to validate_presence_of(:cart).with_message(/must exist/)
    end

    it "require cart item to be associated with a dish" do
      is_expected.to validate_presence_of(:dish).with_message(/must exist/)
    end
  end
  
end
