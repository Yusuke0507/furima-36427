FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture{ 2 }
    municipality{'横浜市'}
    address{ '1-1' }
    building{ '東京ハイツ' }
    phone {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
