# == Schema Information
#
# Table name: user_informations
#
#  id                 :integer          not null, primary key
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
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserInformation, type: :model do
end
