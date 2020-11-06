FactoryBot.define do
  factory :purchase_address do
    post_code { '000-0000' }
    prefecture_id { 2 }
    city { '横浜市' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 12_345_678_912 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
