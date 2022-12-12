class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :account_type, :account_number, :amount_limit, :current_balance
end
