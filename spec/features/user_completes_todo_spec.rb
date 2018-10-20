require 'rails_helper'

feature 'User completes todo' do
  let(:title) { 'buy milk' }

  scenario 'successfully' do
    sign_in
    create_todo(title)
    click_on 'Mark complete'

    expect(page).to display_completed_todo title
  end
end
