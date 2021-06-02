FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end

    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    # passwordは英数字混合が必須のため、テストでは最低12文字以上にしてアプファベットだけになるのを避ける。
    password              {Faker::Internet.password(min_length: 12)}
    password_confirmation {password}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_kana        {person.first.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {Faker::Date.backward}
  end
end