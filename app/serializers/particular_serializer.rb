# == Schema Information
#
# Table name: particulars
#
#  id          :bigint           not null, primary key
#  amount      :float            not null
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
class ParticularSerializer < ActiveModel::Serializer
  attributes :id, :card, :sender, :receiver, :amount

  def sender
    ActiveModelSerializers::SerializableResource.new(object.sender, each_serializer: UserInformationSerializer)
  end

  def receiver
    ActiveModelSerializers::SerializableResource.new(object.receiver, each_serializer: UserInformationSerializer)
  end
end
