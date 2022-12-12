class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :employee_count
end
