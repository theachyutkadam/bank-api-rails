class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :department, :manager, :education, :date_of_joining, :work_status, :designation, :official_email
end
