# == Schema Information
#
# Table name: salaries
#
#  id            :uuid             not null, primary key
#  amount        :float            not null
#  description   :text
#  status        :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :uuid             not null
#  particular_id :uuid             not null
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
class Salary < ApplicationRecord
  belongs_to :employee
  belongs_to :particular

  enum status: { paid: 0, unpaid: 1, pending: 2 }, _default: 'pending'

  validates :status, inclusion: { in: statuses.keys }
  validates :amount, length: { in: 1..200_000 }
end
