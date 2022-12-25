# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string
#  building         :string
#  description      :text
#  flat_number      :string
#  pin_code         :string
#  street           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :integer
#
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :building, :description, :flat_number, :pin_code, :street, :addressable_id, :addressable_type,
             :addressable

  def addressable
    if object.addressable.class.name == "Employee"
      ActiveModelSerializers::SerializableResource.new(object.addressable,  each_serializer: EmployeeSerializer)
    elsif object.addressable.class.name == "Customer"
      ActiveModelSerializers::SerializableResource.new(object.addressable,  each_serializer: CustomerSerializer)
    else
      ActiveModelSerializers::SerializableResource.new(object.addressable,  each_serializer: NomineeSerializer)
    end
  end

end
