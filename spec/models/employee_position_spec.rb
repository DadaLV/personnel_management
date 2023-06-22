require 'rails_helper'

RSpec.describe EmployeePosition, type: :model do
  describe 'associations' do
    it { should belong_to(:employee) }
    it { should belong_to(:position) }
  end

  describe 'validations' do
    let(:employee_position) { FactoryBot.create(:employee_position, :with_employee, :with_position) }
    
    it { should allow_value(nil).for(:start_date) }
    it { should belong_to(:employee) }
    it { should belong_to(:position) }
  end

  describe 'custom validations' do
    let(:employee_position) { FactoryBot.create(:employee_position) }

    it 'validates end_date_requires_start_date' do
      employee_position.start_date = nil
      employee_position.end_date = Date.today + 1
      expect(employee_position).not_to be_valid
      expect(employee_position.errors[:start_date]).to include('must be present when end date is specified')

      employee_position.start_date = Date.today
      expect(employee_position).to be_valid
    end

    it 'validates start_date_before_end_date' do
      employee_position.start_date = Date.today
      employee_position.end_date = Date.today - 1.day
      expect(employee_position).not_to be_valid
      expect(employee_position.errors[:start_date]).to include('must be earlier than end date')
      expect(employee_position.errors[:end_date]).to include('must be later than start date')

      employee_position.start_date = Date.today
      employee_position.end_date = Date.today + 1.day
      expect(employee_position).to be_valid
    end
  end
end