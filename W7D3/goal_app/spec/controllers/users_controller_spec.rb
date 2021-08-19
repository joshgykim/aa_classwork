require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index " do 
    it "render the index users template" do 
      get :index 
      expect(response).to render_template(:index)
    end
  end

  # describe "GET #show " do 
  #   let(:user_params) do
  #     {user: {username: 'minh', password: 'password'}}
  #   end  
  #   let!(:minh) {User.new(username: 'minh', password: 'password')}
  #   it "render the index users template" do 
  #     get :show, id: minh.id
  #     expect(response).to render_template(:show)
  #   end
  # end

  describe "GET #new " do 
    it "render new user template " do 
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create " do 
    context "with_invalid_params" do 
      it "validates the username and the password and returns the user to the sign up page" do 
        post :create, params: {user: {username: "", password: "password"}}
        expect(response).to render_template(:new)
      end
    end
    context "with valid params" do 
      it "redirect users to user:show" do 
        post :create, params: {user: {username: "josh", password: "password"}}
        expect(response).to redirect_to(users_url)
      end
    end
  end

  

end