class Position < ApplicationRecord
  has_many :employee_positions, dependent: :destroy
  has_many :employees, through: :employee_positions
  
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :salary, numericality: { only_integer: true, greater_than: 0 }

end
