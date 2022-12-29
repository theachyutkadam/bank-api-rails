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
FactoryBot.define do
  factory :customer do
    current_balance { Faker::Number.decimal(l_digits: 5) }
    status { Customer.statuses.keys.sample }
  end
end
