FactoryBot.define do
  factory :user do
    nickname { 'test01' }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
    last_name { '赤あおキイロ' }
    first_name { '赤あおキイロ' }
    last_name_kana { 'アカアオキイロ' }
    first_name_kana { 'アカアオキイロ' }
    birthday { '2000/1/1' }
  end
end
