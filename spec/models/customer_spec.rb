# == Schema Information
#
# Table name: customers
#
#  id              :uuid             not null, primary key
#  account_number  :bigint           not null
#  amount_limit    :integer          not null
#  current_balance :float            default(0.0), not null
#  deleted_at      :datetime
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
