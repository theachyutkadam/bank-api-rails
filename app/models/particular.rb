class Particular < ApplicationRecord
  belongs_to :card
  belongs_to :customer

  has_one :particular_details
  has_many :salaries
end
