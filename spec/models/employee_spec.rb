# == Schema Information
#
# Table name: employees
#
#  id              :uuid             not null, primary key
#  date_of_joining :date             not null
#  deleted_at      :datetime
#  designation     :string           not null
#  education       :string           not null
#  official_email  :string
#  salary_amount   :float            default(0.0), not null
#  work_status     :integer          default("available"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  customer_id     :uuid             not null
#  department_id   :uuid             not null
#  manager_id      :uuid             not null
#
# Indexes
#
#  index_employees_on_customer_id    (customer_id)
#  index_employees_on_deleted_at     (deleted_at)
#  index_employees_on_department_id  (department_id)
#  index_employees_on_manager_id     (manager_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (manager_id => managers.id)
#
