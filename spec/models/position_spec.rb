require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'associations' do
    it { should have_many(:employee_positions).dependent(:destroy) }
    it { should have_many(:employees).through(:employee_positions) }
    it { should have_many(:vacations) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
    it { should validate_numericality_of(:salary).only_integer.is_greater_than(0) }
  end
end