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
      let(:account_type ) { create(:account_type) }
      let(:customer ) { build(:customer, account_type: account_type) }
      let!(:addresses) { FactoryBot.create_list(:address, 5) }

      expect(addresses).to be_valid
      expect(Address.count).to eq(5)
    end
  end

  context '#ActiveRecord associations' do
    it 'should belongs_to addressable' do
      expect(Address.reflect_on_association(:addressable).macro).to eq(:belongs_to)
    end
  end
end
