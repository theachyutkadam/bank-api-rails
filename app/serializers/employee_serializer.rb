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
#  work_status     :integer          default("available"), not null
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
class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :salary_amount, :customer, :manager, :department, :education, :date_of_joining, :work_status,
             :designation, :official_email, :user_information, :full_name

  def date_of_joining
    object.date_of_joining.to_fs(:long)
  end

  def full_name
    return object.user_information.full_name if object.user_information
  end

  def manager
    ActiveModelSerializers::SerializableResource.new(object.manager, each_serializer: UserSerializer)
  end

  def customer
    ActiveModelSerializers::SerializableResource.new(object.customer, each_serializer: CustomerSerializer)
  end
end
