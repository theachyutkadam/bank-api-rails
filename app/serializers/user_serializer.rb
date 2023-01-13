# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  deleted_at :datetime
#  email      :string           not null
#  is_admin   :boolean          default(FALSE), not null
#  password   :string           not null
#  status     :integer          default("active"), not null
#  token      :string
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :token, :status, :deleted_at, :is_admin
  # has_one :user_information
end
