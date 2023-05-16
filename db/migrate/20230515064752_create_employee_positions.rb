class CreateEmployeePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_positions do |t|
      t.belongs_to :employee
      t.belongs_to :position

      t.timestamps
    end
  end
end
