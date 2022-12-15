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
class Manager < ApplicationRecord
  belongs_to :user
  belongs_to :department

  has_many :employee
  enum status: { active: 0, inactive: 1, pending: 2 }
  enum designation: { 
    ceo: 'ceo',
    team_leader: 'team_leader', 
    desk_manager: 'desk_manager', 
    senior_manager: 'senior_manager'
  }, _default: 'debit'

  validates :designation, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
