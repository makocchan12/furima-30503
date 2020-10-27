FactoryBot.define do
  factory :item do
    association :user
    name              { 'qaa' }
    description       { Faker::Lorem.sentence }
    category_id       { 2 }
    condition_id { 2 }
    shipping_charge_payer_id { 2 }
    day_required_id { 2 }
    prefecture_id     { 2 }
    price             { 300 }
  end
end
