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
class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :account_type, :account_number, :amount_limit, :current_balance, :user_information

  def user_information
    return object.employee.user_information if object.employee

    object.user_information
  end
end
