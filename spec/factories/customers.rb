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
#  index_customers_on_account_number   (account_number) UNIQUE
#  index_customers_on_account_type_id  (account_type_id)
#  index_customers_on_deleted_at       (deleted_at)
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
