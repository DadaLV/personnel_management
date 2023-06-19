require 'faker'

FactoryBot.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    passport_data { Faker::Base.regexify(/[A-Z]{2}\d{6}/) }
    date_of_birth { Faker::Date.birthday(min_age: 18) }
    place_of_birth { Faker::Address.city }
    home_address { Faker::Address.street_address }
    department

  end
end