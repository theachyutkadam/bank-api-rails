class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :status, :deleted_at, :accountable_id, :accountable_type, :is_admin
end
