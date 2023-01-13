# == Schema Information
#
# Table name: departments
#
#  id             :uuid             not null, primary key
#  employee_count :integer          default(0)
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Department < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_one :manager, dependent: :destroy

  validates :name, :employee_count, presence: true
end
