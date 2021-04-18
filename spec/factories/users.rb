FactoryBot.define do
  factory :user do
    nickname {'test01'}
    email{Faker::Internet.free_email}
    password = 'abc123'
    password{password}
    password_confirmation{password}
    last_name{'てすと'}
    first_name{'わん'}
    last_name_kana{'テスト'}
    first_name_kana{'ワン'}
    birthday{'2000/1/1'}
  end
end