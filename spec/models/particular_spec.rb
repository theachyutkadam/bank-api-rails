# == Schema Information
#
# Table name: particulars
#
#  id          :uuid             not null, primary key
#  amount      :float            not null
#  deleted_at  :datetime
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  card_id     :uuid             not null
#  receiver_id :uuid             not null
#  sender_id   :uuid             not null
#
# Indexes
#
#  index_particulars_on_card_id      (card_id)
#  index_particulars_on_deleted_at   (deleted_at)
#  index_particulars_on_receiver_id  (receiver_id)
#  index_particulars_on_sender_id    (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (card_id => cards.id)
#  fk_rails_...  (receiver_id => user_informations.id)
#  fk_rails_...  (sender_id => user_informations.id)
#
require 'rails_helper'

RSpec.describe Particular, type: :model do
  context '#create' do
    let(:manager_user) { create(:user) }
    let(:department) { create(:department, name: 'Finance') }
    let(:account_type) { create(:account_type) }
    let(:customer) { create(:customer, account_type: account_type) }

    let(:manager) { create(:manager, user: manager_user, department: department) }
    let(:manager_employee) { create(:employee, manager: manager, department: department, customer: customer) }
    let!(:manager_user_information) { create(:user_information, user: manager_user, accountable: manager_employee) }

    # create employee
    let(:employee_user) { create(:user) }
    let(:department) { create(:department, name: 'HR') }
    let(:account_type) { create(:account_type) }
    let(:customer) { create(:customer, account_type: account_type) }

    let(:manager) { create(:manager, user: employee_user, department: department) }
    let(:employee) { create(:employee, manager: manager, department: department, customer: customer) }
    let(:employee_user_information) { create(:user_information, user: employee_user, accountable: employee) }

    # create admin customer
    let(:account_type) { create(:account_type) }
    let(:admin_user) { create(:user, is_admin: true, email: 'admin@gmail.com') }
    let!(:admin_customer) { create(:customer, account_type: account_type, current_balance: 1_000_000.00) }
    let(:admin_card) { create(:card, status: 0, customer: admin_customer) }

    let(:admin_sender) { create(:user_information, user: admin_user, accountable: admin_customer) }
    it 'should create new address' do
      FactoryBot.create_list(:particular, 5, card: admin_card, sender: admin_sender,
                                             receiver: employee_user_information)
      expect(Particular.count).to eq(5)
    end
  end

  context '#ActiveRecord associations' do
    it 'should belongs_to sender' do
      expect(Particular.reflect_on_association(:sender).macro).to eq(:belongs_to)
    end
    it 'should belongs_to receiver' do
      expect(Particular.reflect_on_association(:receiver).macro).to eq(:belongs_to)
    end
  end
end
