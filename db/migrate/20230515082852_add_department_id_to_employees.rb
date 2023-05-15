class AddDepartmentIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :employees, :department, null: false, foreign_key: true
  end
end
