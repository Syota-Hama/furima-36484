FactoryBot.define do
  factory :good do
    items_name        { Faker::Name.initials(number: 40) }
    items_explanation { Faker::Number.number(digits: 1000) }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    status_id         { Faker::Number.between(from: 2, to: 7) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    payment_id        { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    delivery_id       { Faker::Number.between(from: 2, to: 4) }
    user_id           { Faker::Number.number }

    association :user

    after(:build) do |good|
      good.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
