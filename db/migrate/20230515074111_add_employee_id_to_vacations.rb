class AddEmployeeIdToVacations < ActiveRecord::Migration[7.0]
  def change
    add_reference :vacations, :employee, null: false, foreign_key: true
  end
end
