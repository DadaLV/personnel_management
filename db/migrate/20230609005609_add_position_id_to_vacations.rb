class AddPositionIdToVacations < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :vacations, :position
  end
end
