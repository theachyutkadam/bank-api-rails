# == Schema Information
#
# Table name: departments
#
#  id             :integer          not null, primary key
#  deleted_at     :datetime
#  employee_count :integer          default(0)
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_departments_on_deleted_at  (deleted_at)
#
class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :employee_count
end
