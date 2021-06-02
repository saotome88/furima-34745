FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end

    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    # 英数字混合にするため、テストでは＜a1＋最低12文字以上＞にする。
    password              {'a1' + Faker::Internet.password(min_length: 12)}
    password_confirmation {password}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_kana        {person.first.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {Faker::Date.backward}
  end
end