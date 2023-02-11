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
FactoryBot.define do
  factory :address do
    building { Faker::Address.building_number }
    flat_number { Faker::Address.zip }
    street { Faker::Address.street_address }
    pin_code { Faker::Number.number(digits: 6) }
    description { Faker::Address.full_address }
  end
end
