# frozen_string_literal: true

# == Schema Information
#
# Table name: account_types
#
#  id                  :uuid             not null, primary key
#  deleted_at          :datetime
#  loan_intrest_rate   :float            not null
#  saving_intrest_rate :float            not null
#  title               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_account_types_on_deleted_at  (deleted_at)
#
require "rails_helper"

RSpec.describe AccountType, type: :model do
  context "#create" do
    it "should create new account_type" do
      account_type = build(:account_type)
      account_type.save
      expect(account_type).to be_valid
    end
  end

  context "#validations" do
    it "is not valid if title is empty" do
      account_type = build(:account_type, title: " ")
      account_type.save
      expect(account_type.errors.messages[:title].first).to eq("can't be blank")
    end

    it "SAVING_INTREST_RATE should match with constant value" do
      account_type = build(:account_type)
      account_type.save
      expect(account_type.saving_intrest_rate).to eq(AccountType::SAVING_INTREST_RATE)
    end
  end

  context "ActiveRecord associations" do
    it "should has_many customer" do
      expect(AccountType.reflect_on_association(:customer).macro).to eq(:has_many)
    end
  end
end
