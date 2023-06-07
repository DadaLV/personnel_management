class EmployeeDecorator < ApplicationDecorator
  delegate_all
  def find_head_of_department
   positions.find_by(name: "Head of Department")
 end
end