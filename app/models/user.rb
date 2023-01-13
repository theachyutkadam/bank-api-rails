# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  deleted_at :datetime
#  email      :string           not null
#  is_admin   :boolean          default(FALSE), not null
#  password   :string           not null
#  status     :integer          default("active"), not null
#  token      :string
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_one :user_information

  enum status: { active: 0, inactive: 1, pending: 2 }, _default: 'active'

  validates :email, :password, :username, presence: true
  validates :email, :username, :token, uniqueness: true
  validates :status, inclusion: { in: statuses.keys }
  validates :password, length: { in: 6..20 }

  after_create :set_token

  def generate_token
    token = Faker::Internet.device_token
    generate_token if User.where(token: token).any?
    token
  end

  def set_token
    update(token: generate_token)
  end
end
