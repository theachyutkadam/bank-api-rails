# == Schema Information
#
# Table name: managers
#
#  id            :integer          not null, primary key
#  deleted_at    :datetime
#  designation   :integer          not null
#  status        :integer          default("inactive")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :uuid             not null
#  user_id       :uuid             not null
#
# Indexes
#
#  index_managers_on_deleted_at     (deleted_at)
#  index_managers_on_department_id  (department_id)
#  index_managers_on_user_id        (user_id)
#
# Foreign Keys
#
#  department_id  (department_id => departments.id)
#  user_id        (user_id => users.id)
#
class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :department_id, :designation, :status, :full_name

  def full_name
    user_infomation = User.find(object.user.id).user_information
    begin
      user_infomation.full_name
    rescue StandardError
      nil
    end
  end
end
