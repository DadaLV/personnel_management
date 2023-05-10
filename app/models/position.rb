class Position < ApplicationRecord
  has_many :employees

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :salary, presence: true, numericality: { greater_than: 0 }

end
