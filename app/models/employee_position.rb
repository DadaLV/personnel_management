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
end