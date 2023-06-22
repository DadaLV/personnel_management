require 'faker'

FactoryBot.define do
  factory :vacation do
    start_date { Faker::Date.backward(days: 30) }
    end_date { Faker::Date.forward(days: 30) }
    employee
    position
  end
end