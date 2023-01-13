# == Schema Information
#
# Table name: account_types
#
#  id                  :uuid             not null, primary key
#  deleted_at          :datetime
#  loan_intrest_rate   :float            not null
#  saving_intrest_rate :float            not null
#  title               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_account_types_on_deleted_at  (deleted_at)
#
FactoryBot.define do
  factory :account_type do
    title { 'Saving' }
  end
end
