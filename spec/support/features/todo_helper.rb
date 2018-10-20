module Features
  def create_todo(title)
    click_on 'Add todo'
    fill_in 'Title', with: title
    click_on 'Create todo'
  end

  def display_todo(title)
    have_css '.todos li', text: title
  end

  def display_completed_todo(title)
    have_css '.todos li.completed', text: title
  end
end
