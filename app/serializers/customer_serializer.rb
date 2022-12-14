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
class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :account_type, :account_number, :amount_limit, :current_balance, :user_information

  def user_information
    return object.employee.user_information if object.employee

    object.user_information
  end
end
