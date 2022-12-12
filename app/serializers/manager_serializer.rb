class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :user_information, :department, :designation, :status
end
