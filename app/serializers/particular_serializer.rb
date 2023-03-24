# frozen_string_literal: true

# == Schema Information
#
# Table name: particulars
#
#  id          :uuid             not null, primary key
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
#  fk_rails_...  (card_id => cards.id)
#  fk_rails_...  (receiver_id => user_informations.id)
#  fk_rails_...  (sender_id => user_informations.id)
#
class ParticularSerializer < ActiveModel::Serializer
  attributes :id, :card_id, :sender_id, :receiver_id, :amount, :created_at, :sender, :receiver
  def created_at
    object.created_at.to_fs(:long)
  end

  def sender
    ActiveModelSerializers::SerializableResource.new(object.sender, each_serializer: UserInformationSerializer)
  end

  def receiver
    ActiveModelSerializers::SerializableResource.new(object.receiver, each_serializer: UserInformationSerializer)
  end
end
