# == Schema Information
#
# Table name: salaries
#
#  id            :bigint           not null, primary key
#  amount        :float
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :bigint           not null
#  particular_id :bigint           not null
#
# Indexes
#
#  index_salaries_on_employee_id    (employee_id)
#  index_salaries_on_particular_id  (particular_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (particular_id => particulars.id)
#
FactoryBot.define do
  factory :salary do
    amount { Faker::Number.decimal }
    status { 1 }
    association :employee, factory: :employee
    association :particular, factory: :particular
  end
end
