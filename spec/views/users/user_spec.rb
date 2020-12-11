require 'rails_helper'

RSpec.describe 'Users' do
  before :each do
    @user1 = User.create(fullname: 'adam', username: '@adamNI', email: 'test1@test.com', password: '123456', id: 1)
    @user2 = User.create(fullname: 'john', username: '@johNy', email: 'test2@test.com', password: '123456', id: 2)
    @user3 = User.create(fullname: 'mike', username: '@MikemY', email: 'test3@test.com', password: '123456', id: 3)
    Following.create(id: 1, follower_id: 1, followed_id: 3)
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

  feature 'User can' do
    scenario 'user can follow' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users/1'
      expect(page).to have_content('mike')
    end

    scenario 'user can unfollow' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users/3'
      click_on 'Unfollow'
      expect(page).to have_content('Unfollow @MikemY')
    end
  end 
end
