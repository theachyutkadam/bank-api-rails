# == Schema Information
#
# Table name: departments
#
#  id             :bigint           not null, primary key
#  employee_count :integer          default(0)
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :employee_count
end
