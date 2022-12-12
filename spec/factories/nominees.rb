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
#  customer_id :bigint           not null
#
# Indexes
#
#  index_nominees_on_address_id   (address_id)
#  index_nominees_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (customer_id => customers.id)
#
FactoryBot.define do
  factory :nominee do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    contact { Faker::Number.number(digits: 10) }
    gender { 0 }
    relation { 1 }

    association :address, factory: :address
    association :customer, factory: :customer
  end
end
