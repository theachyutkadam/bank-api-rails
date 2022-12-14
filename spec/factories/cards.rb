# == Schema Information
#
# Table name: cards
#
#  id          :bigint           not null, primary key
#  csv         :integer          not null
#  expire_date :datetime         not null
#  is_deleted  :boolean
#  number      :bigint           not null
#  pin         :integer          not null
#  status      :integer          not null
#  title       :string           not null
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
    status { 1 }
    title { 'debit' }
    is_deleted { false }
    # expire_date { 5.years.after }
    # pin { Faker::Number.number(digits: 4) }
    # csv { Faker::Number.number(digits: 3) }
    # number { Faker::Number.number(digits: 12) }

    # association :customer, factory: :customer
  end
end
