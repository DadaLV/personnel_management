class AddVacationDaysToPositions < ActiveRecord::Migration[7.0]
  def change
    add_column :positions, :vacation_days, :integer, default: 24
    add_reference :positions, :employee, foreign_key: true
  end
end
