require 'rails_helper'

RSpec.describe Review, type: :model do
  it "table exists" do 
    expect { Review.new }.not_to raise_error(ActiveRecord::StatementInvalid)
  end

  describe "'body' column" do
    it "exists with a type of 'text'" do 
      expect(Review.column_names).to include('body')
      expect(Review.column_for_attribute('body').type).to eq(:text)
    end

    it "has a 'not null' constraint" do 
      expect(Review.column_for_attribute('body').null).to be(false)
    end 
  end

  describe "'user_id' column" do
    it "exists with a type of 'integer'" do 
      expect(Review.column_names).to include('user_id')
      expect(Review.column_for_attribute('user_id').type).to eq(:integer)
    end
  
    it "has a 'not null' constraint" do 
      expect(Review.column_for_attribute('user_id').null).to be(false)
    end 
  
    it "is indexed" do 
      expect(ActiveRecord::Base.connection.index_exists?(:reviews, :user_id)).to be(true)
    end
  end

  describe "'restaurant_id' column" do
    it "exists with a type of 'integer'" do 
      expect(Review.column_names).to include('restaurant_id')
      expect(Review.column_for_attribute('restaurant_id').type).to eq(:integer)
    end

    it "has a 'not null' constraint" do 
      expect(Review.column_for_attribute('restaurant_id').null).to be(false)
    end 

    it "is indexed" do 
      expect(ActiveRecord::Base.connection.index_exists?(:reviews, :restaurant_id)).to be(true)
    end
  end

  describe "'rating' column" do 
    it "exists with a type of 'integer'" do 
      expect(Review.column_names).to include('rating')
      expect(Review.column_for_attribute('rating').type).to eq(:integer)
    end

    it "has a 'not null' constraint" do 
      expect(Review.column_for_attribute('rating').null).to be(false)
    end 
  end

  describe 'timestamps' do
    it "columns are included ('created_at' and 'updated_at')" do
      expect(Review.column_names).to include('created_at')
      expect(Review.column_for_attribute('created_at').type).to eq(:datetime)
      expect(Review.column_names).to include('updated_at')
      expect(Review.column_for_attribute('updated_at').type).to eq(:datetime)
    end
  end
 
  it 'table has no additional columns' do
    expect(Review.column_names).to contain_exactly('id','body','rating','user_id','restaurant_id','created_at','updated_at')
  end
end
