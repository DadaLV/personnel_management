class EmployeePosition < ApplicationRecord
  
  SALARY_COEFFICIENT = 0.012
  INITIAL_COEFFICIENT = 1

  belongs_to :employee
  belongs_to :position
  
  validate :end_date_requires_start_date
  validate :start_date_before_end_date

  private

  def end_date_requires_start_date
    if end_date.present? && start_date.blank?
      errors.add(:start_date, :end_date_requires_start_date)
    end
  end

  def start_date_before_end_date
    return unless start_date && end_date

    if start_date >= end_date
      errors.add(:start_date, :start_date_before_end_date)
    end
  end

end