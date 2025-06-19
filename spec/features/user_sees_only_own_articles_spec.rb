require 'rails_helper'

feature 'Article visibility' do
  before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  scenario 'regular user sees only their own tasks' do
    user = create(:user, password: 'password123')
    other_user = create(:user, password: 'password123')

    create(:article, title: 'User Task 123', text: 'Some text 123', user: user, assigned_user: user)
    create(:article, title: 'Other Task 123', text: 'Other text 123', user: other_user, assigned_user: other_user)

    visit new_user_session_path
    fill_in 'Электронная почта', with: user.email
    fill_in 'Пароль', with: 'password123'
    click_button 'Войти'

    visit articles_path
    expect(page).to have_content 'User Task'
    expect(page).not_to have_content 'Other Task'
  end
end
