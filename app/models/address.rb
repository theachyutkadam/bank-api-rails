# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  addressable_type :string
#  building         :string
#  deleted_at       :datetime
#  description      :text
#  flat_number      :string
#  pin_code         :string
#  street           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :uuid
#
# Indexes
#
#  index_addresses_on_addressable  (addressable_type,addressable_id)
#  index_addresses_on_deleted_at   (deleted_at)
#
class Address < ApplicationRecord
  acts_as_paranoid
  belongs_to :addressable, polymorphic: true
end
