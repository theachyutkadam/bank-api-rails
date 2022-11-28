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
require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
