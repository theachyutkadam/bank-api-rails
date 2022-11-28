# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  accountable_type   :string
#  adhaar_card_number :string
#  birth_date         :datetime
#  contact            :string
#  email              :string
#  first_name         :string
#  gender             :integer
#  handicap_details   :text
#  is_active          :boolean
#  is_deleted         :boolean
#  is_handicap        :boolean
#  last_name          :string
#  maritial_status    :integer
#  middle_name        :string
#  pan_card_number    :string
#  password           :string
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accountable_id     :integer
#  address_id         :bigint           not null
#
# Indexes
#
#  index_users_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
FactoryBot.define do
  factory :user do
    user_name { Faker::IDNumber.brazilian_id }
    password { "123456" }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    contact { Faker::PhoneNumber.cell_phone_in_e164 }
    birth_date { 18.years.ago }
    gender { 0 }
    maritial_status { 0 }
    is_admin { false }
    is_active { true }
    is_deleted { false }
    pan_card_number { Faker::Base.bothify('?????####?') }
    adhaar_card_number { Faker::Number.number(digits: 12) }
    is_handicap { false }
    association :address, factory: :address

    for_customer # default customer association if none of specified.

    trait :for_customer do
      association :accountable, factory: :customer
    end

    trait :for_employee do
      association :accountable, factory: :employee
    end
  end
end
