require 'rails_helper'

RSpec.describe 'Test to verify if the users probems' do
  before :each do
    @user1 = User.create(fullname: 'adam', username: '@adamNI',email: 'test1@test.com', password: '123456', id: 1)
    @user2 = User.create(fullname: 'john', username: '@johNy', email: 'test2@test.com', password: '123456', id: 2)
    @user3 = User.create(fullname: 'mike', username: '@MikemY', email: 'test3@test.com', password: '123456', id: 3)

    Category.create(id: 1, category: 'Games')

  end
  feature 'User can see all Categories' do
    scenario 'sign in and go to Categories index' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/categories'
      expect(page).to have_content('Games')
    end

    scenario 'Create new category' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/categories/new'
      fill_in 'Category', with: 'cook'
      click_button 'Create Category'
      expect(page).to have_content('Category was successfully created.')
    end
  end
end