class NomineeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name, :contact, :gender, :relation, :customer
end
