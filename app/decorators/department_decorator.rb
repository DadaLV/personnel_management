class DepartmentDecorator < Draper::Decorator
  delegate_all

  def head_of_department
    employees.joins(:positions).where(positions: {name: Position::HEAD_OF_DEPARTMENT}).last&.full_name
  end

 
end