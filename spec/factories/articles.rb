FactoryBot.define do
  factory :articles do
    author factory: :user
    title { Faker::Food.dish }
    description { Faker::Food.description }

    trait :active do
      state { :active }
    end

    trait :archived do
      state { :archived }
    end

  end
end
