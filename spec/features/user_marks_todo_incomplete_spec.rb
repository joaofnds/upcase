require 'rails_helper'

feature 'User marks todo incomplete' do
  let(:title) { 'buy milk' }
  scenario 'successfully' do
    sign_in
    
    create_todo title
    
    click_on 'Mark complete'
    click_on 'Mark incomplete'

    expect(page).not_to display_completed_todo title
    expect(page).to display_todo title
  end
end
