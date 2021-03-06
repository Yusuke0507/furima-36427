FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                        {Faker::Name.initials(number: 2)}
    email                           {Faker::Internet.free_email}
    last_name                       {person.last.kanji}
    first_name                      {person.first.kanji}
    last_name_kana                  {person.last.katakana}
    first_name_kana                 {person.first.katakana}
    password                        { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation           {password}
    birthday                        {Faker::Date.birthday(min_age: 5, max_age: 91)}
  end
end
