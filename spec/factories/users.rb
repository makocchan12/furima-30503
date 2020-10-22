FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2) }
    email                 {Faker::Internet.free_email }
    password              {"111aaa" }
    password_confirmation {"111aaa"}
    first_name            { "竈門" }
    family_name           { "伊之助" }
    first_name_kana       { "ゼンイツ" }
    family_name_kana      { "ネズコ" }
    birth_day             { Faker::Date.backward }
  end
end
