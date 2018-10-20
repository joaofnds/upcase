require 'rails_helper'


feature 'Use creates todo' do
  let(:title) { 'buy milk' }

  scenario 'successfully' do
    sign_in
		create_todo(title)

    expect(page).to display_todo title
  end
end
