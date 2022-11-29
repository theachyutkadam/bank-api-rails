# == Schema Information
#
# Table name: account_types
#
#  id                  :bigint           not null, primary key
#  loan_intrest_rate   :float
#  saving_intrest_rate :float
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :account_type do
    loan_intrest_rate { Faker::Number.decimal(l_digits: 2) }
    saving_intrest_rate { Faker::Number.decimal(l_digits: 2) }
    title { 'Saving' }
  end
end
