require 'rails_helper'

feature 'User sees own todos' do
  let(:title) { "Buy milk" }

  scenario "doesn't see other's todos" do
    Todo.create!(title: title, email: "someone_else@example.com")

    sign_in_as "someone@examle.com"

    expect(page).not_to have_css '.todos li', text: title
  end
end
