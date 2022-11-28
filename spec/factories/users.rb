FactoryBot.define do
  factory :user do
    user_name { Faker::IDNumber.brazilian_id }
    password { "123456" }
    email { Faker::Internet.email }

    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }

    contact { Faker::PhoneNumber.cell_phone_in_e164 }
    gender { 0 }
    maritial_status { 0 }

    is_admin { false }
    is_active { true }
    is_deleted { false }
    pan_card { Faker::Base.bothify('?????####?') }
    adhaar_card { Faker::Number.number(digits: 12) }
    is_handicap { false }
    # address "#{Faker::Address.city}, #{Faker::Address.street_address}"
    association :address, factory: :address

    for_customer # default customer association if none of specified.

    trait :for_customer do
      association :accountable, factory: :customer
    end

    # trait :for_employee do
    #   association :information factory: :employee,
    # end
  end
end
