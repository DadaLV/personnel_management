require 'faker'

FactoryBot.define do
  factory :position do
    name { Faker::Job.title }
    salary { Faker::Number.between(from: 1000, to: 150000) }
  end
end