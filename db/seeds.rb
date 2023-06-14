require 'faker'

positions = Position.create!([
  { name: 'Doctor', salary: 60000, vacation_days: 25 },
  { name: 'Nurse', salary: 35000, vacation_days: 23 },
  { name: 'Pharmacist', salary: 50000, vacation_days: 24 }
])

department = Department.find_by(name: 'Medical')

10.times do
  employee = Employee.create!(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    passport_data: Faker::Base.regexify(/[A-Z]{2}\d{6}/),
    date_of_birth: Faker::Date.birthday(min_age: 18),
    place_of_birth: Faker::Address.city,
    home_address: Faker::Address.street_address,
    department: department
  )

  position = positions.sample

  EmployeePosition.create!(
    employee: employee,
    position: position,
    start_date: Faker::Date.between(from: 2.years.ago, to: Date.today)
  )

  has_vacations = [true, false].sample

  if has_vacations
    MINIMUM_VACATION_DURATION = 14
    start_date = Faker::Date.between(from: 1.year.ago, to: Date.today)
    end_date = Faker::Date.between(from: start_date, to: start_date + MINIMUM_VACATION_DURATION - 1)

    Vacation.create!(
      start_date: start_date,
      end_date: end_date,
      employee: employee,
      position: position
    )
  end
end