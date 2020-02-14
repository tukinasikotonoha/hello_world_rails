FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    account { Faker::Internet.username }
    email { Faker::Internet.email }

    trait :with_user_detail do
      # association :user_detail, factory: :user_detail の省略形
      user_detail
    end
  end
end
