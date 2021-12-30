FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'0000aa'}
    password_confirmation {password}
    first_name            {'山田'}
    family_name           {'陸'}
    first_name_hurigana   {'ヤマダ'}
    family_name_hurigana  {'リク'}
    birthday              {'19911224'}
  end
end