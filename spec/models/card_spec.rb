# == Schema Information
#
# Table name: cards
#
#  id          :bigint           not null, primary key
#  csv         :integer          not null
#  expire_date :datetime         not null
#  is_deleted  :boolean
#  number      :bigint           not null
#  pin         :integer          not null
#  status      :integer          not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_cards_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
require 'rails_helper'

RSpec.describe Card, type: :model do
  context '#create' do
    it 'should create new card' do
      card = build(:card)
      card.save
      expect(card).to be_valid
      expect(Card.count).to eq(1)
    end
  end

  context '#validation' do
    it 'should give error message if csv is empty' do
      card = build(:card, csv: '')
      card.save
      expect(card.errors.messages[:csv].first).to eq("can't be blank")
    end
    it 'should give error message if expire_date is empty' do
      card = build(:card, expire_date: '')
      card.save
      expect(card.errors.messages[:expire_date].first).to eq("can't be blank")
    end
    it 'should give error message if number is empty' do
      card = build(:card, number: '')
      card.save
      expect(card.errors.messages[:number].first).to eq("can't be blank")
    end
    it 'should give error message if pin is empty' do
      card = build(:card, pin: '')
      card.save
      expect(card.errors.messages[:pin].first).to eq("can't be blank")
    end
    it 'should give error message if title is empty' do
      card = build(:card, title: '')
      card.save
      expect(card.errors.messages[:title].first).to eq("can't be blank")
    end
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
      create(:card, number: '111111111111')
      card = build(:card, number: '111111111111')
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
