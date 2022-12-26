# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  date_of_joining :date             not null
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
class Employee < ApplicationRecord
  belongs_to :manager
  belongs_to :customer
  belongs_to :department

  has_one :address, as: :addressable
  has_one :user_information, as: :accountable

  has_many :salaries

  enum work_status: { available: 'available', on_leave: 'on_leave', resignate: 'resignate'}
  validates :date_of_joining, :designation, presence: true
  validates :work_status, inclusion: { in: work_statuses.keys }

  after_create :update_employee_count

  def update_employee_count
    old_count = department.employee_count
    department.update(employee_count: old_count + 1)
  end
end
