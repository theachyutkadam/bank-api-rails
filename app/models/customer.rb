# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id              :uuid             not null, primary key
#  account_number  :bigint           not null
#  active_at       :datetime
#  amount_limit    :integer          not null
#  blocked_at      :datetime
#  current_balance :float            default(0.0), not null
#  deleted_at      :datetime
#  inactive_at     :datetime
#  status          :integer          default("inactive"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_type_id :uuid             not null
#
# Indexes
#
#  index_customers_on_account_type_id  (account_type_id)
#  index_customers_on_deleted_at       (deleted_at)
#
# Foreign Keys
#
#  fk_rails_...  (account_type_id => account_types.id)
#
class Customer < ApplicationRecord
  include AASM
  acts_as_paranoid
  belongs_to :account_type

  has_one :nominee
  has_one :employee
  has_many :cards, dependent: :destroy
  has_many :particular, dependent: :destroy

  has_one :address, as: :addressable
  has_one :user_information, as: :accountable

  AMOUNT_LIMIT = 20_000 # contant variable

  enum status: { active: 0, inactive: 1, blocked: 2 }, _default: "inactive"

  validates :account_number, :amount_limit, presence: true
  validates :account_number, uniqueness: true, numericality: true, length: { is: 10 }

  before_validation :set_customer_details

  aasm :status, timestamps: true do
    state :inactive, initial: true
    state :active, :blocked

    event :activate do
      transitions from: :inactive, to: :active
    end

    event :block do
      transitions from: %i[active inactive], to: :blocked
    end
  end

  def set_customer_details
    self.account_number ||= generate_account_number
    self.amount_limit ||= AMOUNT_LIMIT
    self.account_type_id ||= AccountType.first.id
  end

  def generate_account_number
    account_number = rand(1_000_000_000..9_999_999_999)
    check_account_number(account_number)
  end

  def check_account_number(account_number)
    if Customer.where(account_number: account_number).any?
      generate_account_number
    else
      account_number
    end
  end

  def user_information
    return employee.user_information if employee.present? # employee login

    UserInformation.find_by(accountable_id: id, accountable_type: "Customer") # customer login
  end
end
