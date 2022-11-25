class Manager < ApplicationRecord
  belongs_to :employee
  belongs_to :department

  has_many :employee
end
