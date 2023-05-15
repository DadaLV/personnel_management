class Employee < ApplicationRecord
  has_many :employee_positions, dependent: :destroy
  has_many :positions, through: :employee_positions
  has_many :vacations
  belongs_to :department
    
  validates :first_name, presence: true, length: {minimum: 2, maximum: 30}
  validates :middle_name, allow_blank: true, length: {minimum: 2, maximum: 30}
  validates :last_name, presence: true, length: {minimum: 2, maximum: 30}
  validates :passport_data, presence: true, uniqueness: true, format: { with: /\A[A-Za-z]{2}\d{6}\z/, message: "must have two letters followed by six digits" }
  validates :date_of_birth, presence: true
  validate :date_of_birth_not_younger_than_15_years
  validates :place_of_birth, presence: true, length: {minimum: 2, maximum: 30}
  validates :home_address, presence: true, length: {minimum: 2, maximum: 30}

  private

  def date_of_birth_not_younger_than_15_years
    if date_of_birth.present? && date_of_birth > Date.today - 15.years
      errors.add(:date_of_birth, "employee must be at least 15 years old")
    end
  end
end
