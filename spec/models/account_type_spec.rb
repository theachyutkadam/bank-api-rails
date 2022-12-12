# == Schema Information
#
# Table name: account_types
#
#  id                  :bigint           not null, primary key
#  loan_intrest_rate   :float
#  saving_intrest_rate :float
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe AccountType, type: :model do
  context '#create' do
    it 'should create new account_type' do
      account_type = build(:account_type)
      account_type.save
      expect(account_type).to be_valid
    end

    it 'should destroy account_type' do
      account_type = create(:account_type)
      account_type.destroy
      expect(account_type).to be_valid
    end
  end

  context '#validations' do
    it 'is not valid if title is empty' do
      account_type = build(:account_type, title: ' ')
      account_type.save
      expect(account_type.errors.messages[:title].first).to eq("can't be blank")
    end

    it 'is not valid if LOAN_INTREST_RATE is empty' do
      account_type = build(:account_type, loan_intrest_rate: ' ')
      account_type.save
      expect(account_type.errors.messages[:loan_intrest_rate].first).to eq("can't be blank")
    end
    it 'LOAN_INTREST_RATE should match with constant value' do
      account_type = build(:account_type)
      account_type.save
      expect(account_type.loan_intrest_rate).to eq(AccountType::LOAN_INTREST_RATE)
    end

    it 'is not valid if SAVING_INTREST_RATE is empty' do
      account_type = build(:account_type, saving_intrest_rate: ' ')
      account_type.save
      expect(account_type.errors.messages[:saving_intrest_rate].first).to eq("can't be blank")
    end
    it 'SAVING_INTREST_RATE should match with constant value' do
      account_type = build(:account_type)
      account_type.save
      expect(account_type.saving_intrest_rate).to eq(AccountType::SAVING_INTREST_RATE)
    end
  end

  context 'ActiveRecord associations' do
    it 'should has_one customer' do
      expect(AccountType.reflect_on_association(:customer).macro).to eq(:has_one)
    end
  end
end
