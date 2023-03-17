# frozen_string_literal: true

# == Schema Information
#
# Table name: departments
#
#  id             :uuid             not null, primary key
#  deleted_at     :datetime
#  employee_count :integer          default(0)
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_departments_on_deleted_at  (deleted_at)
#  index_departments_on_name        (name) UNIQUE
#
FactoryBot.define do
  factory :department do
    name { "Finance" }
    employee_count { Faker::Number.number(digits: 2) }
  end
end
