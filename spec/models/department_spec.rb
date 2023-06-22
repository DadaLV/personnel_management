require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'associations' do
    it { should have_many(:employees).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
    it { should validate_presence_of(:abbreviation) }
    it { should validate_length_of(:abbreviation).is_at_least(2).is_at_most(5) }
  end
end