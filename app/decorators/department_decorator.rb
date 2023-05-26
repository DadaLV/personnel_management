class DepartmentDecorator < SimpleDelegator

  def head_of_department
    employees.find_by(position: "Head of Department")
  end
  
end