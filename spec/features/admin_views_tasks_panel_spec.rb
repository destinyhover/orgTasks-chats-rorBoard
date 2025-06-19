require 'rails_helper'

feature 'Admin panel' do
  before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  scenario 'admin sees all tasks' do
    admin = create(:user, role: 'admin', password: 'password123')
    user = create(:user, password: 'password123')

    create(:article, title: 'Admin Task 123', text: 'Some text 123', user: user, assigned_user: user)

    visit new_user_session_path
    fill_in 'Электронная почта', with: admin.email
    fill_in 'Пароль', with: 'password123'
    click_button 'Войти'

    visit admin_tasks_path
    expect(page).to have_content 'Admin Task'
    expect(page).to have_content user.username
  end
end
