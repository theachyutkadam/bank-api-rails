# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string
#  building         :string
#  description      :text
#  flat_number      :string
#  pin_code         :string
#  street           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :integer
#
require 'rails_helper'

RSpec.describe Address, type: :model do
  context '#create' do
    it 'should create new address' do
      address = build(:address)
      address.save
      expect(address).to be_valid
      expect(Address.count).to eq(1)
    end
  end

  context '#ActiveRecord associations' do
    it 'should belongs_to addressable' do
      expect(Address.reflect_on_association(:addressable).macro).to eq(:belongs_to)
    end
  end
end
