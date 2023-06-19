require 'rails_helper'

RSpec.describe Vacation, type: :model do
  describe 'associations' do
    it { should belong_to(:employee) }
    it { should belong_to(:position).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  describe 'custom validations' do
    let(:vacation) { FactoryBot.build(:vacation) }

    it 'validates end_date_after_start_date' do
      vacation.start_date = Date.today
      vacation.end_date = Date.today - 2.day
      expect(vacation).not_to be_valid
      expect(vacation.errors[:end_date]).to include('must be after the start date')

      vacation.start_date = Date.today
      vacation.end_date = Date.today + 2.day
      expect(vacation).to be_valid
    end

    it 'validates validate_department_vacation_limit' do
      department = FactoryBot.create(:department)
      employees = FactoryBot.create_list(:employee, 6, department: department)
    
      start_date = Date.today + 2.days
      end_date = start_date + 13.days
    
      employees[0..4].each do |employee|
        FactoryBot.create(:vacation, employee: employee, start_date: start_date, end_date: end_date)
      end
    
      vacation = FactoryBot.create(:vacation, employee: employees[5], start_date: start_date, end_date: end_date)
      
      expect(vacation).not_to be_valid
      expect(vacation.errors[:base]).to include('Maximum number of employees on vacation reached for this department.')
    
      vacation.employee = FactoryBot.create(:employee, department: department)
      vacation.start_date = start_date + 15.days
      vacation.end_date = end_date + 15.days
      expect(vacation).to be_valid
    end
  end
end