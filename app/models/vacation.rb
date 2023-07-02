class Vacation < ApplicationRecord  

  MAX_SIMULTANEOUS_VACATIONS = 5

  belongs_to :employee, required: true
  belongs_to :position, optional: true
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validate :validate_department_vacation_limit

  private

  def end_date_after_start_date
   return unless start_date && end_date
   if end_date < start_date
      errors.add(:end_date, :end_date_after_start_date)
    end
  end

  def validate_department_vacation_limit
    return unless employee && employee.department
  
   same_time_vacations = Vacation.where(employee_id: employee.department.employees)
                                   .where.not(id: id)
                                   .where(start_date: start_date..end_date)
                                   .or(Vacation.where(end_date: start_date..end_date))
                                   .count
  
    if same_time_vacations > Vacation::MAX_SIMULTANEOUS_VACATIONS
      errors.add(:base, :validate_department_vacation_limit)
    end
  end

end
