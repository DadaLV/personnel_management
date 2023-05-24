# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
  Employee.create!(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    passport_data: Faker::Base.regexify(/[A-Z]{2}\d{6}/),
    date_of_birth: Faker::Date.birthday(min_age: 18),
    place_of_birth: Faker::Address.city,
    home_address: Faker::Address.street_address,
    created_at: nil,
    updated_at: nil,
    department_id: 4
  )
end
