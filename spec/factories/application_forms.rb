FactoryBot.define do
  factory :application_form do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    company { Faker::Company.name }
    message { Faker::Lorem.sentences(number: 1, supplemental: true) }
    created_at { Faker::Date.in_date_period }
    member
  end
end
