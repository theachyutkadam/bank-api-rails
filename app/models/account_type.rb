# == Schema Information
#
# Table name: account_types
#
#  id                  :integer          not null, primary key
#  deleted_at          :datetime
#  loan_intrest_rate   :float            not null
#  saving_intrest_rate :float            not null
#  title               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_account_types_on_deleted_at  (deleted_at)
#
class AccountType < ApplicationRecord
  acts_as_paranoid
  has_many :customer, dependent: :destroy

  before_validation :set_intrest_rate
  LOAN_INTREST_RATE = 8.0
  SAVING_INTREST_RATE = 4.0

  validates :title, :saving_intrest_rate, :loan_intrest_rate, presence: true

  def set_intrest_rate
    self.loan_intrest_rate = AccountType::LOAN_INTREST_RATE
    self.saving_intrest_rate = AccountType::SAVING_INTREST_RATE
  end
end
