class Department < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  validates :abbreviation, presence: true, length: {minimum: 2, maximum: 5}
  validate :maximum_employees_limit



  def head_of_depa
    head_employee = employees.joins(:positions).where(positions: { name: 'Head of Department' }).last
    full_name = "#{head_employee.first_name} #{head_employee.last_name}" if head_employee
    full_name
  end
  private
  

  def maximum_employees_limit
    if employees.count >= 10
      errors.add(:base, "Maximum number of employees (10) reached for this department.")
    end
  end
end
