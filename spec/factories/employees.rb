# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  date_of_joining :datetime         not null
#  designation     :string           not null
#  education       :string           not null
#  official_email  :string
#  salary_amount   :float            default(0.0), not null
#  work_status     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  customer_id     :bigint           not null
#  department_id   :bigint           not null
#  manager_id      :bigint           not null
#
# Indexes
#
#  index_employees_on_customer_id    (customer_id)
#  index_employees_on_department_id  (department_id)
#  index_employees_on_manager_id     (manager_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (manager_id => managers.id)
#
FactoryBot.define do
  factory :employee do
    date_of_joining { Faker::Date.between(from: '1999-01-11', to: Date.today) }
    designation { 'cashier' }
    education { Faker::Educator.degree }
    official_email { Faker::Internet.email }
    work_status { 0 }
    salary_amount { Faker::Number.decimal(l_digits: 5) }
  end
end
