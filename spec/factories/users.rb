FactoryBot.define do
  factory :user do
    title { Faker::Internet.email }
  end
end