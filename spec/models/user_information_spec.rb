# == Schema Information
#
# Table name: user_informations
#
#  id                 :bigint           not null, primary key
#  adhaar_card_number :string
#  birth_date         :datetime
#  contact            :string
#  first_name         :string
#  gender             :integer
#  handicap_details   :text
#  is_handicap        :boolean
#  last_name          :string
#  maritial_status    :integer
#  middle_name        :string
#  pan_card_number    :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
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
require 'rails_helper'

RSpec.describe UserInformation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
