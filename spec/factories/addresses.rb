FactoryBot.define do
  factory :address do
    building { Faker::Address.building_number  }
    flat_number { Faker::Address.zip }
    road { Faker::Address.street_address }
    description { "sample" }
  end
end

