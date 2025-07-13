# frozen_string_literal: true

# == Schema Information
#
# Table name: salaries
#
#  id            :uuid             not null, primary key
#  amount        :float            not null
#  deleted_at    :datetime
#  description   :text
#  status        :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :uuid             not null
#  particular_id :uuid             not null
#
# Indexes
#
#  index_salaries_on_deleted_at     (deleted_at)
#  index_salaries_on_employee_id    (employee_id)
#  index_salaries_on_particular_id  (particular_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (particular_id => particulars.id)
#
class SalarySerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :amount, :status, :particular_id
end
