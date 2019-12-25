FactoryBot.define do
  factory :comments do
    user
    article
    text { Faker::Food.description }
  end
end
