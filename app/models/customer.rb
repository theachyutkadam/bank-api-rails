# == Schema Information
#
# Table name: customers
#
#  id              :bigint           not null, primary key
#  account_number  :bigint           not null
#  amount_limit    :integer          not null
#  current_balance :float            default(0.0), not null
#  status          :integer          default("inactive"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_type_id :bigint           not null
#
# Indexes
#
#  index_customers_on_account_type_id  (account_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_type_id => account_types.id)
#
class Customer < ApplicationRecord
  belongs_to :account_type

  has_one :nominee
  has_one :employee
  has_many :cards, dependent: :destroy
  has_many :particular, dependent: :destroy

  has_one :address, as: :addressable
  has_one :user_information, as: :accountable

  AMOUNT_LIMIT = 20_000

  enum status: { active: 0, inactive: 1, blocked: 2}, _default: 'inactive'

  validates :account_number, :amount_limit, presence: true
  validates :account_number, uniqueness: true, numericality: true, length: { is: 10 }

  before_validation :set_customer_details

  def set_customer_details
    self.account_number ||= generate_account_number
    self.amount_limit ||= AMOUNT_LIMIT
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
    return self.employee.user_information if self.employee.present? # return a employee user_information
    UserInformation.find_by(accountable_id: self.id) # return a customer user_information
  end
end
