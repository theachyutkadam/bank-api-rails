# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  active_at   :datetime
#  blocked_at  :datetime
#  deleted_at  :datetime
#  email       :string           not null
#  inactive_at :datetime
#  is_admin    :boolean          default(FALSE), not null
#  password    :string           not null
#  status      :integer          default("active"), not null
#  token       :string
#  username    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#
FactoryBot.define do
  factory :user do
    username { Faker::Alphanumeric.alphanumeric(number: 10) }
    email { Faker::Internet.email }
    password { '123456' }
    token { Faker::Internet.device_token }
    is_admin { false }
    status { User.statuses.keys.sample }
  end
end
