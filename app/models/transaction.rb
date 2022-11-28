class Transaction < ApplicationRecord
  belongs_to :card
  belongs_to :customer

  has_one :transactions_user
  has_many :salaries
end
