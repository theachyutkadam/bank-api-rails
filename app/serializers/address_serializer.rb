class AddressSerializer < ActiveModel::Serializer
  attributes :id, :building, :description, :flat_number, :pin_code, :street
end
