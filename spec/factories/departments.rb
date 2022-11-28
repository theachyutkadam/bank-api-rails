# == Schema Information
#
# Table name: departments
#
#  id             :bigint           not null, primary key
#  employee_count :integer
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :department do
    name { "Finance" }
    employee_count { Faker::Number.number(digits: 2) }
  end
end
