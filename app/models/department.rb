class Department < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  validates :abbreviation, presence: true, length: {minimum: 2, maximum: 5}
  
  HEAD_OF_DEPARTMENT = 'Head of Department'
end
