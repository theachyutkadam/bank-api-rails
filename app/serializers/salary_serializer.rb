class SalarySerializer < ActiveModel::Serializer
  attributes :id, :employee, :amount, :status, :particular
end
