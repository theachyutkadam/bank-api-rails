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
  has_many :customer

  before_create :set_intrest_rate
  LOAN_INTREST_RATE = 8.0
  SAVING_INTREST_RATE = 4.0

  validates :title, :saving_intrest_rate, :loan_intrest_rate, presence: true

  def set_intrest_rate
    self.loan_intrest_rate = AccountType::LOAN_INTREST_RATE
    self.saving_intrest_rate = AccountType::SAVING_INTREST_RATE
  end
end
