class Vacation < ApplicationRecord  

  MAX_SIMULTANEOUS_VACATIONS = 5

  belongs_to :employee
  belongs_to :position
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validate :validate_department_vacation_limit

  private

  def end_date_after_start_date
   if end_date < start_date
      errors.add(:end_date, "must be after the start date")
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
      errors.add(:base, "Maximum number of employees on vacation reached for this department.")
    end
  end

end
