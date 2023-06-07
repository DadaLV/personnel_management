class EmployeePosition < ApplicationRecord
  belongs_to :employee
  belongs_to :position
  
  validate :end_date_requires_start_date
  validate :start_date_before_end_date

  private

  def end_date_requires_start_date
    if end_date.present? && start_date.blank?
      errors.add(:start_date, "must be present when end date is specified")
    end
  end

  def start_date_before_end_date
    return unless start_date && end_date

    if start_date >= end_date
      errors.add(:start_date, "must be earlier than end date")
      errors.add(:end_date, "must be later than start date")
    end
  end

  def total_salary
    years_worked = calculate_years_worked
    salary + (0.2 * years_worked * salary)
  end

  private

  def calculate_years_worked
    return 0 if start_date.nil?
    if end_date.nil?
      current_date = Date.today
      years = current_date.year - start_date.year
      years -= 1 if current_date.month < start_date.month || (current_date.month == start_date.month && current_date.day < start_date.day)
      years
    else
      years = end_date.year - start_date.year
      years -= 1 if end_date.month < start_date.month || (end_date.month == start_date.month && end_date.day < start_date.day)
      years
    end
  end
end