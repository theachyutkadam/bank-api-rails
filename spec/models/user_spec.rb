# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  accountable_type   :string
#  adhaar_card_number :string
#  birth_date         :datetime
#  contact            :string
#  email              :string
#  first_name         :string
#  gender             :integer
#  handicap_details   :text
#  is_active          :boolean
#  is_deleted         :boolean
#  is_handicap        :boolean
#  last_name          :string
#  maritial_status    :integer
#  middle_name        :string
#  pan_card_number    :string
#  password           :string
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accountable_id     :integer
#  address_id         :bigint           not null
#
# Indexes
#
#  index_users_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
