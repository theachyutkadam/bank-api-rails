# == Schema Information
#
# Table name: account_types
#
#  id                  :bigint           not null, primary key
#  loan_intrest_rate   :float
#  saving_intrest_rate :float
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class AccountType < ApplicationRecord
  has_one :customer

  LOAN_INTREST_RATE = 8.0
  SAVING_INTREST_RATE = 4.0

  validates :title, presence: true
end
