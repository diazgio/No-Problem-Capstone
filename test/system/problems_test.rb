# frozen_string_literal: true

require 'application_system_test_case'

class ProblemsTest < ApplicationSystemTestCase
  setup do
    @problem = problems(:one)
  end

  test 'visiting the index' do
    visit problems_url
    assert_selector 'h1', text: 'Problems'
  end

  test 'creating a Problem' do
    visit problems_url
    click_on 'New Problem'

    fill_in 'Content', with: @problem.content
    fill_in 'User', with: @problem.user_id
    click_on 'Create Problem'

    assert_text 'Problem was successfully created'
    click_on 'Back'
  end

  test 'updating a Problem' do
    visit problems_url
    click_on 'Edit', match: :first

    fill_in 'Content', with: @problem.content
    fill_in 'User', with: @problem.user_id
    click_on 'Update Problem'

    assert_text 'Problem was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Problem' do
    visit problems_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Problem was successfully destroyed'
  end
end
