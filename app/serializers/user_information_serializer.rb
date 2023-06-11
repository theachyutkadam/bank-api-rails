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
class UserInformationSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :middle_name,
             :last_name,
             :contact,
             :avatar_url,
             :gender,
             :birth_date,
             :pan_card_number,
             :adhaar_card_number,
             :is_handicap,
             :handicap_details,
             :maritial_status,
             :user_id,
             :accountable_id,
             :accountable_type,
             :full_name

  def birth_date
    object.birth_date.to_fs(:long)
  end

  def full_name
    object.full_name
  rescue StandardError
    nil
  end
end
