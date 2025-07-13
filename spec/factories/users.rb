# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id          :uuid             not null, primary key
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
#  index_users_on_email       (email) UNIQUE
#  index_users_on_token       (token) UNIQUE
#  index_users_on_username    (username) UNIQUE
#
FactoryBot.define do
  factory :user do
    username { Faker::Alphanumeric.alphanumeric(number: 10) }
    email { Faker::Internet.email }
    password { "123456" }
    token { Faker::Internet.device_token }
    is_admin { false }
    status { User.statuses.keys.sample }
  end
end
