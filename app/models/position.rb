class Position < ApplicationRecord
  has_many :employees

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :salary, numericality: { only_integer: true, greater_than: 0 }

end
