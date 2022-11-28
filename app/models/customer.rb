class Customer < ApplicationRecord
  belongs_to :nominee
  belongs_to :account_type
  belongs_to :address

  has_many :cards
  has_many :transactions
  has_many :transactions_details
  has_one :user, as: :accountable
end
