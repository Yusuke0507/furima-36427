FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture{ 2 }
    municipality{'横浜市'}
    address{ '1-1' }
    building{ '東京ハイツ' }
    phone {'08012345678'}
    user_id { 1 }
    item_id { 1 }
  end
end
