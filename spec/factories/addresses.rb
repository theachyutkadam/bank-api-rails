# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  building    :string
#  description :text
#  flat_number :string
#  pin_code    :string
#  street      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :address do
    building { Faker::Address.building_number  }
    flat_number { Faker::Address.zip }
    road { Faker::Address.street_address }
    description { "sample" }
  end
end

