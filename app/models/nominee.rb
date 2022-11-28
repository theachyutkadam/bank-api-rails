# == Schema Information
#
# Table name: nominees
#
#  id          :bigint           not null, primary key
#  contact     :string
#  first_name  :string
#  gender      :integer
#  last_name   :string
#  middle_name :string
#  relation    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address_id  :bigint           not null
#
# Indexes
#
#  index_nominees_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
class Nominee < ApplicationRecord
  belongs_to :address

  has_one :customer
  enum gender: { male: 0, female: 1, transgender: 2 }
  enum relation: { mother: 0, father: 1, wife: 2, child: 3 }
end
