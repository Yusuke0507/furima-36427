FactoryBot.define do
  factory :item do
    name{Faker::Lorem.word}
    detail{Faker::Lorem.sentence}
    category_id{Faker::Number.within(range: 2..11) }
    status_id{Faker::Number.within(range: 2..7) }
    shipping_fee_id{Faker::Number.within(range: 2..3) }
    area_id{Faker::Number.within(range: 2..48) }
    days_to_ship_id{Faker::Number.within(range: 2..4) }
    price{Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
