require 'faker'

FactoryBot.define do
  factory :employee_position do
    start_date { Faker::Date.backward(days: 365) }
    
    employee
    position

    trait :with_employee do
      association :employee
    end

    trait :with_position do
      association :position
    end
  end
end