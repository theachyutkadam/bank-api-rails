# == Schema Information
#
# Table name: customers
#
#  id              :bigint           not null, primary key
#  account_number  :bigint           not null
#  amount_limit    :integer          not null
#  current_balance :float            default(0.0), not null
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
FactoryBot.define do
  factory :customer do
    # account_number { Faker::Number.number(digits: 10) }
    # amount_limit { 50_000.00 }
    current_balance { Faker::Number.decimal(l_digits: 5) }

    association :account_type, factory: :account_type

    trait :for_user_infomation do
      association :accountable, factory: :user_infomation
    end
    trait :for_address do
      association :addressable, factory: :address
    end
  end
end
