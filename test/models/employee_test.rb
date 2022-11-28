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
require "test_helper"

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
