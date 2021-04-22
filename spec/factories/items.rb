FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { 1 }
    item_status_id { 1 }
    delivery_charge_burden_id { 1 }
    prefectures_id { 1 }
    days_to_ship_id { 1 }
    price { 300 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
