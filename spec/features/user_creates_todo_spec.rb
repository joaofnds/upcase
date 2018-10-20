require 'rails_helper'


feature 'Use creates todo' do
  let(:title) { 'buy milk' }

  scenario 'successfully' do
    sign_in

    click_on 'Add todo'

    fill_in 'Title', with: title
    click_on 'Create todo'

    expect(page).to have_css 'ul.todos li', text: title
  end
end
