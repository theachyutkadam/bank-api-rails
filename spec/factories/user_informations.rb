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
FactoryBot.define do
  factory :user_information do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    contact { Faker::PhoneNumber.cell_phone_in_e164 }
    gender { 0 }
    birth_date { 18.years.ago }
    maritial_status { 0 }
    pan_card_number { Faker::Base.bothify('?????####?') }
    adhaar_card_number { Faker::Number.number(digits: 12) }
    is_handicap { false }
    handicap_details { "MyText" }

    association :user, factory: :user
  end
end
