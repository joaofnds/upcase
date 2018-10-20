require 'rails_helper'

feature 'User completes todo' do
  let(:title) { 'buy milk' }

  scenario 'successfully' do
    sign_in

    click_on 'Add todo'

    fill_in 'Title', with: title
    click_on 'Create todo'

    click_on 'Mark complete'

    expect(page).to have_css 'ul.todos li.completed', text: title
  end
end
