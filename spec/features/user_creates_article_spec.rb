require 'rails_helper'

feature 'Article creation' do
    before(:each) do
    # Очистка базы данных перед каждым тестом
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  scenario 'user creates an article' do
    sign_up
    #save_and_open_page
    visit new_article_path

    # Заполнение формы
    fill_in 'article_title', with: 'Title example'
    fill_in 'article_text', with: 'Text example'

    click_button 'Post'

    # Проверка наличия заголовка статьи на странице
    expect(page).to have_content 'Title example'
  end
end
