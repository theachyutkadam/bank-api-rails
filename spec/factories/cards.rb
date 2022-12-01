# == Schema Information
#
# Table name: cards
#
#  id          :bigint           not null, primary key
#  csv         :integer
#  expire_date :datetime
#  is_deleted  :boolean
#  number      :bigint
#  pin         :integer
#  status      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_cards_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
FactoryBot.define do
  factory :card do
    title { 'Debit' }
    csv { Faker::Number.binary(digits: 3) }
    expire_date { 5.years.after }
    status { 1 }
    is_deleted { false }
    number { Faker::Number.number(digits: 16) }
    pin { Faker::Number.binary(digits: 4) }

    association :customer, factory: :customer
  end
end
