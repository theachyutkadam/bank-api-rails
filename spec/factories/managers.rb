# == Schema Information
#
# Table name: managers
#
#  id            :bigint           not null, primary key
#  designation   :string
#  is_active     :boolean
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
