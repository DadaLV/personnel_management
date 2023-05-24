class Department < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  validates :abbreviation, presence: true, length: {minimum: 2, maximum: 5}
  validate :maximum_employees_limit

  private

  def maximum_employees_limit
    if employees.count >= 10
      errors.add(:base, "Maximum number of employees (10) reached for this department.")
    end
  end
end
