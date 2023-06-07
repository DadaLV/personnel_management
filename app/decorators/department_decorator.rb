class DepartmentDecorator < Draper::Decorator
  delegate_all

  def head_of_department
    head_employee = employees.joins(:positions).where(positions: { name: 'Head of Department' }).last
    head_employee&.full_name if head_employee.present?
  end

 
end