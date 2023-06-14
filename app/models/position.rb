class Position < ApplicationRecord
  
  HEAD_OF_DEPARTMENT = 'Head of Department'

  has_many :employee_positions, dependent: :destroy
  has_many :employees, through: :employee_positions
  has_many :vacations
  
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :salary, numericality: { only_integer: true, greater_than: 0 }

end
