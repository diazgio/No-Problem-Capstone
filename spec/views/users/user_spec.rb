require 'rails_helper'

RSpec.describe 'Users' do
  before :each do
    @user1 = User.create(name: 'adam', email: 'test1@test.com', password: '123456', id: '1')
    @user2 = User.create(name: 'john', email: 'test2@test.com', password: '123456', id: '2')
    @user3 = User.create(name: 'mike', email: 'test3@test.com', password: '123456', id: '3')

  end
  feature 'User can' do
    scenario 'user can login and logout' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      click_on 'Logout'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
