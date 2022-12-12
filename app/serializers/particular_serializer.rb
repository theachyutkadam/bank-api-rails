class ParticularSerializer < ActiveModel::Serializer
  attributes :id, :card, :customer, :debit_amount, :credit_amount, :current_balance
end
