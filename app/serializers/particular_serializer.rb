# == Schema Information
#
# Table name: particulars
#
#  id              :bigint           not null, primary key
#  credit_amount   :float
#  current_balance :float
#  debit_amount    :float
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
class ParticularSerializer < ActiveModel::Serializer
  attributes :id, :card, :customer, :debit_amount, :credit_amount, :current_balance
end