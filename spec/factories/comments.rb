FactoryBot.define do
    sequence :body do |n|
    "Comment body #{n}"
  end

  factory :comment do
    author {"athr"}
    body {generate(:body)}
    end
end