# == Schema Information
#
# Table name: nominees
#
#  id          :bigint           not null, primary key
#  contact     :string
#  first_name  :string
#  gender      :integer
#  last_name   :string
#  middle_name :string
#  relation    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address_id  :bigint           not null
#
# Indexes
#
#  index_nominees_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
FactoryBot.define do
  factory :nominee do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    contact { Faker::PhoneNumber.cell_phone_in_e164 }
    gender { 0 }
    relation { Faker::Relationship.familial(connection: 'direct')  }

    association :address, factory: :address
  end
end
