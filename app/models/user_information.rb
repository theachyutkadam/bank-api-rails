# frozen_string_literal: true

# == Schema Information
#
# Table name: user_informations
#
#  id                 :uuid             not null, primary key
#  accountable_type   :string
#  adhaar_card_number :string           not null
#  birth_date         :date             not null
#  contact            :string           not null
#  deleted_at         :datetime
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
#  accountable_id     :uuid
#  user_id            :uuid             not null
#
# Indexes
#
#  index_user_informations_on_accountable  (accountable_type,accountable_id)
#  index_user_informations_on_deleted_at   (deleted_at)
#  index_user_informations_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserInformation < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :accountable, polymorphic: true

  has_one_attached :avatar

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end

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
  validates :adhaar_card_number, numericality: true, length: { is: 12 }
  validates :contact, numericality: true, length: { is: 10 }
  validates :pan_card_number, length: { is: 10 }
  validates :user_id, :pan_card_number, :contact, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
