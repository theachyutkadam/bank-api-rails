# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  addressable_type :string
#  building         :string
#  deleted_at       :datetime
#  description      :text
#  flat_number      :string
#  pin_code         :string
#  street           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :uuid
#
# Indexes
#
#  index_addresses_on_addressable  (addressable_type,addressable_id)
#  index_addresses_on_deleted_at   (deleted_at)
#
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :building, :description, :flat_number, :pin_code, :street, :addressable_id, :addressable_type
  # :addressable

  # def addressable
  #   if object.addressable.instance_of?(::Employee)
  #     ActiveModelSerializers::SerializableResource.new(object.addressable,  each_serializer: EmployeeSerializer)
  #   elsif object.addressable.instance_of?(::Customer)
  #     ActiveModelSerializers::SerializableResource.new(object.addressable,  each_serializer: CustomerSerializer)
  #   else
  #     ActiveModelSerializers::SerializableResource.new(object.addressable,  each_serializer: NomineeSerializer)
  #   end
  # end
end
