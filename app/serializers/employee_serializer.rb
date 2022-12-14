# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  date_of_joining :datetime         not null
#  designation     :string           not null
#  education       :string           not null
#  official_email  :string
#  work_status     :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  department_id   :bigint           not null
#  manager_id      :bigint           not null
#
# Indexes
#
#  index_employees_on_department_id  (department_id)
#  index_employees_on_manager_id     (manager_id)
#
# Foreign Keys
#
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (manager_id => managers.id)
#
class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :department, :manager, :education, :date_of_joining, :work_status, :designation, :official_email
end
