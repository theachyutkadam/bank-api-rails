# == Schema Information
#
# Table name: salaries
#
#  id            :bigint           not null, primary key
#  amount        :float
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :bigint           not null
#  particular_id :bigint           not null
#
# Indexes
#
#  index_salaries_on_employee_id    (employee_id)
#  index_salaries_on_particular_id  (particular_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (particular_id => particulars.id)
#
require "test_helper"

class SalaryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
