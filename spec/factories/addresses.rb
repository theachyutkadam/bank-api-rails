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
FactoryBot.define do
  factory :address do
    building { Faker::Address.building_number }
    flat_number { Faker::Address.zip }
    street { Faker::Address.street_address }
    pin_code { Faker::Number.number(digits: 6) }
    description { Faker::Address.full_address }

    for_customer # default customer association if none of specified.

    trait :for_customer do
      association :addressable, factory: :customer
    end

    trait :for_employee do
      association :addressable, factory: :employee
    end
  end
end
