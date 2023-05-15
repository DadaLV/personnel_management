class RemoveIdNumberFromEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :id_number
  end
end
