# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  accountable_type :string
#  deleted_at       :datetime
#  email            :string
#  is_admin         :boolean
#  password         :string
#  status           :integer
#  username         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  accountable_id   :integer
#
FactoryBot.define do
  factory :user do
    username { Faker::IDNumber.brazilian_id }
    email { Faker::Internet.email }
    password { '123456' }
    is_admin { false }
    status { 0 }

    for_customer # default customer association if none of specified.

    trait :for_customer do
      association :accountable, factory: :customer
    end

    trait :for_employee do
      association :accountable, factory: :employee
    end
  end
end
