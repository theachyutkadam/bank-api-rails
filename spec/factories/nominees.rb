# == Schema Information
#
# Table name: nominees
#
#  id          :integer          not null, primary key
#  contact     :string           not null
#  deleted_at  :datetime
#  first_name  :string           not null
#  gender      :integer          not null
#  last_name   :string           not null
#  middle_name :string           not null
#  relation    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid             not null
#
# Indexes
#
#  index_nominees_on_customer_id  (customer_id)
#  index_nominees_on_deleted_at   (deleted_at)
#
# Foreign Keys
#
#  customer_id  (customer_id => customers.id)
#
FactoryBot.define do
  factory :nominee do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    contact { Faker::Number.number(digits: 10) }
    gender { Nominee.genders.keys.sample }
    relation { Nominee.relations.keys.sample }
  end
end
