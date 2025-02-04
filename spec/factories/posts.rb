FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    body { Faker::Lorem.paragraphs(number: 3).join("\n") }
    views { rand(1..100) }
    reading_time { rand(1..10) }
    user
  end
end
