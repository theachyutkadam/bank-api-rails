# == Schema Information
#
# Table name: managers
#
#  id            :bigint           not null, primary key
#  designation   :string           not null
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_managers_on_department_id  (department_id)
#  index_managers_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (user_id => users.id)
#
class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :user, :department, :designation, :status, :full_name

  def full_name
    user_infomation = User.find(object.user.id).user_information
    return user_infomation.full_name rescue nil
  end
end
