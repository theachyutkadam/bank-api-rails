# == Schema Information
#
# Table name: account_types
#
#  id                  :bigint           not null, primary key
#  loan_intrest_rate   :float            not null
#  saving_intrest_rate :float            not null
#  title               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class AccountTypeSerializer < ActiveModel::Serializer
  attributes :id, :title, :loan_intrest_rate, :saving_intrest_rate
end
