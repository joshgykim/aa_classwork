require 'rails_helper'

RSpec.describe User, type: :model do
  #Validations

  it { should validate_presence_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:password_digest) }

  subject(:minh) { FactoryBot.create(:user) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:session_token) }

  #Associations

  #Methods
  describe "user find credentials" do 
    it "find user with username and password" do 
      minh = FactoryBot.create(:user, username: 'minh')
      expect(User.find_by_credential("minh", "password")).to eq(minh) 
    end

    it "return nil if user does not exist" do 
      expect(User.find_by_credential("random", "password")).to eq(nil)
    end
  end

  describe "password= password" do 
    it "create password_digest and set @password to password" do 
      josh = FactoryBot.create(:user, password: 'helloworld', username: 'josh')
      expect(josh.password_digest).not_to eq(nil)
      expect(josh.password).to eq("helloworld")
    end
  end






end