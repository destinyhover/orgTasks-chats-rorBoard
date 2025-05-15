require 'rails_helper'

feature 'Article creation' do
  before(:each) do
    # Очистка базы данных перед каждым тестом
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  scenario 'user creates an article' do
    # Имитируем вход пользователя
    sign_up
    visit new_article_path

    # Заполнение формы создания статьи
    fill_in 'article[title]', with: 'Title example'
    fill_in 'article[text]', with: 'Text example'
    select 'Не назначено', from: 'article[assigned_user_id]'

    # Отправка формы
    click_button 'Отправить'

    # Проверка наличия заголовка статьи на странице
    expect(page).to have_content 'Title example'
    expect(page).to have_content 'Text example'
  end
end
