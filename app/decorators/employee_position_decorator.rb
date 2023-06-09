class EmployeePositionDecorator < Draper::Decorator
  delegate_all

  def years_on_position
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
  
  def total_salary
    (position.salary * (EmployeePosition::INITIAL_COEFFICIENT + EmployeePosition::SALARY_COEFFICIENT * years_on_position)).round
  end
end