class CreateEmployeePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_positions do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
