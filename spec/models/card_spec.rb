# == Schema Information
#
# Table name: cards
#
#  id          :uuid             not null, primary key
#  csv         :integer          not null
#  deleted_at  :datetime
#  expire_date :datetime         not null
#  is_deleted  :boolean
#  number      :bigint           not null
#  pin         :integer          not null
#  status      :integer          default("inactive"), not null
#  title       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid             not null
#
# Indexes
#
#  index_cards_on_customer_id  (customer_id)
#  index_cards_on_deleted_at   (deleted_at)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
require 'rails_helper'

RSpec.describe Card, type: :model do
  context '#create' do
    it 'should create new card' do
      account_type = FactoryBot.create(:account_type)
      customer = FactoryBot.create(:customer, account_type: account_type)
      FactoryBot.create_list(:card, 5, customer: customer)

      expect(Card.count).to eq(5)
    end
  end

  context '#validation' do
    it 'should give error message if number length greater than 12' do
      card = build(:card, number: '1234567891234')
      card.save
      expect(card.errors.messages[:number].first).to eq('is the wrong length (should be 12 characters)')
    end
    it 'should give error message if csv length greater than 3' do
      card = build(:card, csv: '1234')
      card.save
      expect(card.errors.messages[:csv].first).to eq('is the wrong length (should be 3 characters)')
    end
    it 'should give error message if pin length greater than 4' do
      card = build(:card, pin: '12345')
      card.save
      expect(card.errors.messages[:pin].first).to eq('is the wrong length (should be 4 characters)')
    end
    it 'should give error message if number length less than 12' do
      card = build(:card, number: '12345678912')
      card.save
      expect(card.errors.messages[:number].first).to eq('is the wrong length (should be 12 characters)')
    end
    it 'should give error message if csv length less than 3' do
      card = build(:card, csv: '12')
      card.save
      expect(card.errors.messages[:csv].first).to eq('is the wrong length (should be 3 characters)')
    end
    it 'should give error message if pin length less than 4' do
      card = build(:card, pin: '123')
      card.save
      expect(card.errors.messages[:pin].first).to eq('is the wrong length (should be 4 characters)')
    end
    it 'should give error message if number not unique' do
      # let(:account_type) { create(:account_type) }
      # let(:customer) { build(:customer, account_type: account_type) }
      account_type = FactoryBot.create(:account_type)
      customer = FactoryBot.create(:customer, account_type: account_type)
      FactoryBot.create(:card, number: '111111111111', customer: customer)
      card = build(:card, number: '111111111111', customer: customer)
      card.save
      expect { card.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context '#ActiveRecord associations' do
    it 'should belongs_to customer' do
      expect(Card.reflect_on_association(:customer).macro).to eq(:belongs_to)
    end
    it 'should has_many transactions' do
      expect(Card.reflect_on_association(:transactions).macro).to eq(:has_many)
    end
  end
end
