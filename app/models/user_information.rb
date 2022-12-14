# == Schema Information
#
# Table name: user_informations
#
#  id                 :bigint           not null, primary key
#  accountable_type   :string
#  adhaar_card_number :string           not null
#  birth_date         :datetime         not null
#  contact            :string           not null
#  first_name         :string           not null
#  gender             :integer          not null
#  handicap_details   :text
#  is_handicap        :boolean
#  last_name          :string           not null
#  maritial_status    :integer          not null
#  middle_name        :string           not null
#  pan_card_number    :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accountable_id     :integer
#  user_id            :bigint           not null
#
# Indexes
#
#  index_user_informations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserInformation < ApplicationRecord
  belongs_to :user
  belongs_to :accountable, polymorphic: true

  enum gender: { male: 0, female: 1, other: 2 }
  enum maritial_status: { single: 0, married: 1, devorsed: 2 }

  validates :adhaar_card_number,
            :birth_date,
            :contact,
            :first_name,
            :gender,
            :last_name,
            :maritial_status,
            :middle_name,
            presence: true

  validates :gender, inclusion: { in: genders.keys }
  validates :adhaar_card_number, uniqueness: true, numericality: true, length: { is: 12 }
  validates :contact, numericality: true, length: { is: 10 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
