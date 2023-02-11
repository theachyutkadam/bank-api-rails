# == Schema Information
#
# Table name: employees
#
#  id              :integer          not null, primary key
#  active_at       :datetime
#  available_at    :datetime
#  date_of_joining :date             not null
#  deleted_at      :datetime
#  designation     :string           not null
#  education       :string           not null
#  official_email  :string
#  resignate_at    :datetime
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
#  customer_id    (customer_id => customers.id)
#  department_id  (department_id => departments.id)
#  manager_id     (manager_id => managers.id)
#
class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :salary_amount, :customer_id, :manager_id, :department_id, :education, :date_of_joining, :work_status,
             :designation, :official_email, :user_information

  def date_of_joining
    object.date_of_joining.to_fs(:long)
  end

  def manager
    ActiveModelSerializers::SerializableResource.new(object.manager, each_serializer: UserSerializer)
  end

  def customer
    ActiveModelSerializers::SerializableResource.new(object.customer, each_serializer: CustomerSerializer)
  end
end
