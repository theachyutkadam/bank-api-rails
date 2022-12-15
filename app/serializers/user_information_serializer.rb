# == Schema Information
#
# Table name: user_informations
#
#  id                 :bigint           not null, primary key
#  accountable_type   :string
#  adhaar_card_number :string           not null
#  birth_date         :date             not null
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
class UserInformationSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :middle_name,
             :last_name,
             :contact,
             :gender,
             :birth_date,
             :pan_card_number,
             :adhaar_card_number,
             :is_handicap,
             :handicap_details,
             :maritial_status,
             :user,
             :accountable_id,
             :accountable_type,
             :accountable

  def birth_date
    return object.birth_date.to_fs(:long)
  end
end
