class VacationDecorator < ApplicationDecorator
  delegate_all

  def vacation_period
    end_date.present? ? "#{start_date} - #{end_date}" : "#{start_date} - "
  end

  def used_vacation_days
    (end_date - start_date + 1).to_i
  end
  
end