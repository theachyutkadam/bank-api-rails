# == Schema Information
#
# Table name: particulars
#
#  id              :bigint           not null, primary key
#  credit_amount   :float            not null
#  current_balance :float            not null
#  debit_amount    :float            not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  card_id         :bigint           not null
#  customer_id     :bigint           not null
#
# Indexes
#
#  index_particulars_on_card_id      (card_id)
#  index_particulars_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (card_id => cards.id)
#  fk_rails_...  (customer_id => customers.id)
#
FactoryBot.define do
  factory :particular do
    credit_amount { Faker::Number.decimal }
    debit_amount { Faker::Number.decimal }
    current_balance { Faker::Number.decimal }
    association :card, factory: :card
    association :customer, factory: :customer
  end
end
