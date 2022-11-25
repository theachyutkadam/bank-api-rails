class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :manager
  belongs_to :address
  has_one :user, as: :accountable
  has_many :salary
end
