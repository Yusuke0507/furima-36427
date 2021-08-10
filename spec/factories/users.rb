FactoryBot.define do
  factory :user do
    nickname                        {Faker::Name.initials(number: 2)}
    email                           {Faker::Internet.free_email}
    last_name                       {Faker::Name.last_name}
    first_name                      {Faker::Name.first_name}
    last_name_kana                  {Faker::Name.last_name}
    first_name_kana                 {Faker::Name.first_name}
    password                        {Faker::Internet.password(min_length: 6)}
    password_confirmation           {password}
    birthday                        {Faker::Date.birthday(min_age: 5, max_age: 91)}
  end
end
