FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'太郎'}
    last_name_kana        {'スズキ'}
    first_name_kana       {'タロウ'}
    birthday
  end
end