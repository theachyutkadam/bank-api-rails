# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  email      :string           not null
#  is_admin   :boolean          not null
#  password   :string           not null
#  status     :integer          not null
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :status, :deleted_at, :accountable_id, :accountable_type, :accountable,
             :is_admin
end
