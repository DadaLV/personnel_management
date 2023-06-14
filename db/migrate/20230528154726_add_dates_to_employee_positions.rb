class AddDatesToEmployeePositions < ActiveRecord::Migration[7.0]
  def change
    add_column :employee_positions, :start_date, :date
    add_column :employee_positions, :end_date, :date
  end
end
