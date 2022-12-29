# == Schema Information
#
# Table name: particulars
#
#  id          :bigint           not null, primary key
#  amount      :float            not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  card_id     :bigint           not null
#  receiver_id :bigint           not null
#  sender_id   :bigint           not null
#
# Indexes
#
#  index_particulars_on_card_id      (card_id)
#  index_particulars_on_receiver_id  (receiver_id)
#  index_particulars_on_sender_id    (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (card_id => cards.id)
#  fk_rails_...  (receiver_id => user_informations.id)
#  fk_rails_...  (sender_id => user_informations.id)
#
FactoryBot.define do
  factory :particular do
    amount { Faker::Number.decimal(l_digits: 3) }
  end
end
