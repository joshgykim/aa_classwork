require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_path
    expect(page).to have_content "Sign up"
  end

  feature 'signing up a user' do
    before(:each) do
        visit new_user_url
        fill_in 'Username', with: 'josh'
        fill_in 'Password', with: 'password'
        click_on 'Create user'
    end 

    scenario 'shows username on the homepage after signup' do
        expect(page).to have_content 'josh'
    end
  end

end

feature 'logging in' do

  scenario 'takes a username and password' do
    visit new_session_path
    expect(page).to have_content "Log In"
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  scenario 'shows username on the homepage after login' do
    User.create!(username: "josh", password: "password")
    visit new_session_path
    fill_in 'Username', with: "josh"
    fill_in 'Password', with: "password"
    click_on 'Log In'

    expect(page).to have_content "josh"
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).to have_content "Log In"
  end
  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    expect(page).not_to have_content "josh"
  end
end