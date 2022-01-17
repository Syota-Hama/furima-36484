FactoryBot.define do
  factory :order_address do
    post_code     { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalitis { '世田谷区' }
    address       { '1-2-3' }
    building_name { 'ハイツ' }
    telephone_number { Faker::Number.number(digits: 11)}
  end
end
