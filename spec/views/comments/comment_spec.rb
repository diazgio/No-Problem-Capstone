require 'rails_helper'

RSpec.describe 'Test to verify if the users probems' do
  before :each do
    @user1 = User.create(fullname: 'adam', username: '@adamNI', email: 'test1@test.com', password: '123456', id: 1)
    @user2 = User.create(fullname: 'john', username: '@johNy', email: 'test2@test.com', password: '123456', id: 2)
    @user3 = User.create(fullname: 'mike', username: '@MikemY', email: 'test3@test.com', password: '123456', id: 3)
    Category.create(id: 1, category: 'Games')
    Category.create(id: 2, category: 'Cook')
    Category.create(id: 3, category: 'Ruby')
    Problem.create(id: 1, user_id: 1, body: 'Adam Problem', category_id: 1)
    Problem.create(id: 2, user_id: 2, body: 'John Problem', category_id: 2)
    Problem.create(id: 3, user_id: 3, body: 'Mike Problem', category_id: 3)
    Comment.create(id: 1, user_id: 1, problem_id: 1, content: 'Dont worry')
  end
  feature 'User can add Comments' do
    scenario 'sign in and go to Problems index' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/problems'
      expect(page).to have_content('Dont worry')
    end
  end
end
