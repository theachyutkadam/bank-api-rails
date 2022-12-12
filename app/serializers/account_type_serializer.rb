class AccountTypeSerializer < ActiveModel::Serializer
  attributes :id, :title, :loan_intrest_rate, :saving_intrest_rate
end
