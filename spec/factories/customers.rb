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
#  address_id      :bigint           not null
#  nominee_id      :bigint           not null
#
# Indexes
#
#  index_customers_on_account_type_id  (account_type_id)
#  index_customers_on_address_id       (address_id)
#  index_customers_on_nominee_id       (nominee_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_type_id => account_types.id)
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (nominee_id => nominees.id)
#
FactoryBot.define do
  factory :customer do
    account_number { Faker::Bank.account_number(digits: 10) }
    amount_limit { 50000.00 }
    current_balance { Faker::Number.decimal(l_digits: 5, r_digits: 2) }

    association :address, factory: :address
    association :nominee, factory: :nominee

    trait :for_user do
      association :accountable, factory: :user
    end
  end
end
