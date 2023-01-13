# == Schema Information
#
# Table name: addresses
#
#  id               :uuid             not null, primary key
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
require 'rails_helper'

RSpec.describe Address, type: :model do
  context '#create' do
    it 'should create new address' do
      account_type = FactoryBot.create(:account_type)
      customer = FactoryBot.create(:customer, account_type: account_type)
      FactoryBot.create_list(:address, 5, addressable: customer)
      expect(Address.count).to eq(5)
    end
  end

  context '#ActiveRecord associations' do
    it 'should belongs_to addressable' do
      expect(Address.reflect_on_association(:addressable).macro).to eq(:belongs_to)
    end
  end
end
