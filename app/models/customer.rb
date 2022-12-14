# == Schema Information
#
# Table name: customers
#
#  id              :bigint           not null, primary key
#  account_number  :bigint
#  amount_limit    :integer
#  current_balance :float
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
  has_many :cards
  has_many :transactions
  has_many :transactions_details

  has_one :user, as: :accountable
  has_one :address, as: :addressable

  AMOUNT_LIMIT = 20_000

  validates :account_number, :amount_limit, presence: true
  validates :account_number, uniqueness: true, numericality: true, length: { is: 10 }

  before_validation :set_customer_details, on: :create

  def set_customer_details
    self.account_number = generate_account_number
    self.amount_limit = AMOUNT_LIMIT
  end

  def generate_account_number
    account_number = rand(1111111111..9999999999)
    check_account_number(account_number)
  end

  def check_account_number account_number
    if Customer.where(account_number: account_number).any?
      generate_account_number 
    else
      account_number
    end
  end

  def create_user
    random_value = SecureRandom.alphanumeric(5)
    User.create(
      username: (id.to_s + '_' + random_value),
      email: "#{random_value}@sample.com",
      password: '123456',
      accountable: self,
      status: 2
    )
  end
end
