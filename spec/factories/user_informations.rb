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
FactoryBot.define do
  factory :user_information do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    contact { Faker::Base.numerify("##########") }
    birth_date { 18.years.ago }
    gender { UserInformation.genders.keys.sample }
    maritial_status { UserInformation.maritial_statuses.keys.sample }
    pan_card_number { Faker::Base.bothify("?????####?") }
    adhaar_card_number { Faker::Number.number(digits: 12) }
    is_handicap { false }
    handicap_details { "MyText" }

    # after :create do |user_information|
    #   file_path = Rails.root.join('spec', 'support', 'assets', 'piano.jpg')
    #   file = fixture_file_upload(file_path, 'image/jpg')
    #   user_information.avatar.attach(file)
    # end
  end
end
