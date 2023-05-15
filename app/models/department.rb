class Department < ApplicationRecord
  has_many :employees

  validates :name, presence: true, length: {minimum: 2, maximum: 30}
  validates :abbreviation, presence: true, length: {minimum: 2, maximum: 5}
end
