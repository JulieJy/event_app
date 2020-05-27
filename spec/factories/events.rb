FactoryBot.define do
  factory :event do
    name { Faker::Music::RockBand.name }
    date { 2.days_ago }
    description { "Full description of my event" }
    email { "mail@mail.com" }
  end
end
