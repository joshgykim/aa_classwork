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

require 'rails_helper'

RSpec.describe Review, type: :model do
  subject(:review) { Review.find_by_rating(5) }

  it "is associated with a reviewer" do
    expect(review.reviewer.username).to eq("donald")
  end

  it "is associated with a restaurant" do
    expect(review.restaurant.name).to eq("Bobandys Burgers")
  end

  describe "validations" do
    it "require review to be associated with a user" do
      is_expected.to validate_presence_of(:reviewer).with_message(/must exist/)
    end

    it "require review to be associated with a restaurant" do
      is_expected.to validate_presence_of(:restaurant).with_message(/must exist/)
    end
  end
  
end
