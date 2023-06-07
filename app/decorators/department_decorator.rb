class DepartmentDecorator < Draper::Decorator
  delegate_all

  def head_of_department
    head_employee = employees.joins(:positions).where(positions: { name: 'Head of Department' }).last
    full_name = "#{head_employee.first_name} #{head_employee.last_name}" if head_employee
    full_name
  end
end