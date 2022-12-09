# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  date_of_joining :datetime
#  designation     :string
#  education       :string
#  official_email  :string
#  work_status     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  address_id      :bigint           not null
#  department_id   :bigint           not null
#  manager_id      :bigint           not null
#
# Indexes
#
#  index_employees_on_address_id     (address_id)
#  index_employees_on_department_id  (department_id)
#  index_employees_on_manager_id     (manager_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (manager_id => managers.id)
#
class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :manager
  belongs_to :address

  has_one :user, as: :accountable
  has_many :salaries

  enum work_status: { available: 0, on_leave: 1 }
  after_create :create_user

  validates :date_of_joining, :designation, presence: true
  validates :work_status, inclusion: { in: work_statuses.keys }

  private

  def create_user
    random_value = SecureRandom.alphanumeric(5) 
    User.create(
      username: (id.to_s + '_' + random_value),
      email: "#{random_value}@sample.com",
      password: '123456',
      accountable: self,
      status: 2
    )
  end
end
