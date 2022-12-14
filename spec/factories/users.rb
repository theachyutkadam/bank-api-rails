# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  email      :string           not null
#  is_admin   :boolean          default(FALSE), not null
#  password   :string           not null
#  status     :integer          not null
#  token      :string
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
