FactoryBot.define do
  factory :article do
    title {"Article title"}
    text {"Article text"}
    user
  end

      trait :with_comments do
      after(:create) do |article, evaluator|
        create_list :comment, 3, article: article
        
      end
    end
end