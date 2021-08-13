# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject(:cart) { Cart.first }

  it "is associated with a customer" do
    expect(cart.customer.username).to eq("randy")
  end

  it "is associated with cart items" do
    expect(cart.cart_items.first.cart_id).to eq(cart.id)
  end

  it "is associated with dishes" do
    expect(cart.dishes.first.name).to eq("Burrito Burger")
  end

  describe "validations" do
    it "require cart to be associated with a customer" do
      is_expected.to validate_presence_of(:customer).with_message(/must exist/)
    end
  end
  
end
