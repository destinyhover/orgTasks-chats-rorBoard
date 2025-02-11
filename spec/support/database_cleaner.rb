RSpec.configure do |config|
  # Убедитесь, что база данных очищается перед каждым тестом
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  # Очищаем базу данных после каждого теста
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end