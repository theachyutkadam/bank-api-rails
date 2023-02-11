# == Schema Information
#
# Table name: particulars
#
#  id          :integer          not null, primary key
#  amount      :float            not null
#  deleted_at  :datetime
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  card_id     :uuid             not null
#  receiver_id :uuid             not null
#  sender_id   :uuid             not null
#
# Indexes
#
#  index_particulars_on_card_id      (card_id)
#  index_particulars_on_deleted_at   (deleted_at)
#  index_particulars_on_receiver_id  (receiver_id)
#  index_particulars_on_sender_id    (sender_id)
#
# Foreign Keys
#
#  card_id      (card_id => cards.id)
#  receiver_id  (receiver_id => user_informations.id)
#  sender_id    (sender_id => user_informations.id)
#
FactoryBot.define do
  factory :particular do
    amount { Faker::Number.decimal(l_digits: 3) }
  end
end
