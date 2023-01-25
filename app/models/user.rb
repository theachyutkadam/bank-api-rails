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
#
class User < ApplicationRecord
  include AASM
  acts_as_paranoid
  has_one :user_information

  enum status: { active: 0, inactive: 1, blocked: 2 }, _default: 'active'

  validates :email, :password, :username, presence: true
  validates :email, :username, :token, uniqueness: true
  validates :status, inclusion: { in: statuses.keys }
  validates :password, length: { in: 6..20 }

  after_create :set_token

  aasm :status, timestamps: true do
    state :active, initial: true
    state :inactive, :blocked

    event :activate do
      transitions from: %i[inactive blocked], to: :active
    end

    event :block do
      transitions from: %i[active inactive], to: :blocked
    end
  end

  def generate_token
    token = Faker::Internet.device_token
    generate_token if User.where(token: token).any?
    token
  end

  def set_token
    update(token: generate_token)
  end
end
