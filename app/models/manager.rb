class Manager < ApplicationRecord
  belongs_to :user
  belongs_to :department

  has_many :employee
end
