# == Schema Information
#
# Table name: account_types
#
#  id                  :uuid             not null, primary key
#  loan_intrest_rate   :float            not null
#  saving_intrest_rate :float            not null
#  title               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :account_type do
    title { 'Saving' }
  end
end
