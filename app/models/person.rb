class Person < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true
  validates :born_on, presence: true
end
