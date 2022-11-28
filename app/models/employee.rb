class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :manager
  belongs_to :address
end
