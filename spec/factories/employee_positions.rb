require 'faker'

FactoryBot.define do
  factory :employee_position do
    start_date { Faker::Date.backward(days: 365) }

    employee
    position

  end
end