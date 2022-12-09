# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  accountable_type :string
#  deleted_at       :datetime
#  email            :string
#  is_admin         :boolean
#  password         :string
#  status           :integer
#  username         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  accountable_id   :integer
#
class User < ApplicationRecord
  belongs_to :accountable, polymorphic: true
  has_one :user_information

  enum status: { active: 0, inactive: 1, pending: 2 }

  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :status, inclusion: { in: statuses.keys }
  validates :password, length: { in: 6..20 }

end
