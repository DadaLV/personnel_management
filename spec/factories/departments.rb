require 'faker'

FactoryBot.define do
  factory :department do
    name { Faker::Job.field }
    abbreviation { Faker::Lorem.characters(number: 3).upcase }

    employee
  end
end