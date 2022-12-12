class ParticularDetailsSerializer < ActiveModel::Serializer
  attributes :id, :particular, :sender, :receiver
end
