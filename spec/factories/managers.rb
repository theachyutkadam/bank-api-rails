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
FactoryBot.define do
  factory :manager do
    designation { 'Senior Manager' }
    status { 0 }

    # association :department, factory: :department
    # association :user, factory: :user
  end
end
