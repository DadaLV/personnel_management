require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { FactoryBot.build(:employee) }
  
  describe 'associations' do
    it { should have_many(:employee_positions).dependent(:destroy) }
    it { should have_many(:positions).through(:employee_positions) }
    it { should have_many(:vacations).dependent(:destroy) }
    it { should belong_to(:department).required }
  end

  describe 'validations' do
    employee = FactoryBot.create(:employee)
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(2).is_at_most(30) }
    it { should validate_length_of(:middle_name).is_at_least(2).is_at_most(30).allow_blank }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(2).is_at_most(30) }
    it { should validate_presence_of(:passport_data) }
    it { should validate_uniqueness_of(:passport_data) }
    it { should allow_value('AB123456').for(:passport_data) }
    it { should_not allow_value('A123456B').for(:passport_data) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:place_of_birth) }
    it { should validate_length_of(:place_of_birth).is_at_least(2).is_at_most(30) }
    it { should validate_presence_of(:home_address) }
    it { should validate_length_of(:home_address).is_at_least(2).is_at_most(30) }
  end

  describe 'custom validations' do
    
    it 'validates date_of_birth_not_younger_than_15_years' do
      employee.date_of_birth = Date.today - 14.years
      expect(employee).not_to be_valid
      expect(employee.errors[:date_of_birth]).to include('employee must be at least 15 years old')

      employee.date_of_birth = Date.today - 15.years
      expect(employee).to be_valid
    end

    it 'validates department_employee_limit' do
      department = FactoryBot.create(:department)
      FactoryBot.create_list(:employee, Employee::MAXIMUM_NUMBER_OF_EMPLOYEES_IN_DEPARTMENT, department: department)

      employee.department = department
      expect(employee).not_to be_valid
      expect(employee.errors[:base]).to include("Maximum number of employees (#{Employee::MAXIMUM_NUMBER_OF_EMPLOYEES_IN_DEPARTMENT}) reached for this department.")

      employee.department = FactoryBot.create(:department)
      expect(employee).to be_valid
    end
  end

  describe 'methods' do
    let(:employee) { FactoryBot.build(:employee, first_name: 'John', last_name: 'Doe') }

    it 'returns the full name' do
      expect(employee.full_name).to eq('John Doe')
    end
  end
end