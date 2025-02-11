FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
    sequence :username do |n|
    "person#{n}"
  end

  factory :user do
    email { generate(:email) }  # Используем последовательность для email
    password { "password123" }
    username { generate(:username) }  # Например, генерируем случайный юзернейм
  end
end
