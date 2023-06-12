FactoryBot.define do
  factory :house do
    name { Faker::Lorem.words(number: rand(3..5)).join(' ')[0...16] }
    address { Faker::Address.full_address }
    night_price { Faker::Number.between(from: 100, to: 1000) }
    city { Faker::Address.city[0...16] }
    description { Faker::Lorem.sentence }
    photo { Faker::Internet.url }
  end
end
