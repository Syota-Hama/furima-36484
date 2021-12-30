FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    family_name           { person.last.kanji }
    first_name_hurigana   { person.first.katakana }
    family_name_hurigana  { person.last.katakana }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
