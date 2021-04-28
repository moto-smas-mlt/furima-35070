FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '福岡市博多区' }
    house_number { '1-2-3' }
    building_name { 'テックキャンプ' }
    tel_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
