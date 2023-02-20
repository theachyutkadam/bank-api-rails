# frozen_string_literal: true

require "rails_helper"
require "sidekiq/testing"
Sidekiq::Testing.fake!

RSpec.describe EmployeeSalaryWorker, type: :worker do
  # create create manager
  let(:account_type) { create(:account_type) }
  let(:manager_user) { create(:user) }
  let(:department) { create(:department, name: "Finance") }
  let(:customer_manager) { create(:customer, account_type: account_type) }
  let(:manager) { create(:manager, user: manager_user, department: department) }
  let(:manager_employee) do
    create(:employee, work_status: 0, manager: manager, department: department, customer: customer_manager)
  end
  let(:manager_user_information) { create(:user_information, user: manager_user, accountable: manager_employee) }

  # create employee
  let(:employee_user) { create(:user) }
  let(:department) { create(:department, name: "HR") }
  let(:customer_employee) { create(:customer, account_type: account_type) }
  let(:employee) do
    create(:employee, work_status: 0, manager: manager, department: department, customer: customer_employee)
  end
  let(:employee_user_information) { create(:user_information, user: employee_user, accountable: employee) }

  let!(:manager_old_balance) { customer_manager.current_balance }
  let!(:emplooyee_old_balance) { customer_employee.current_balance }

  # create admin customer
  let(:admin_user) { create(:user, is_admin: true, email: "admin@gmail.com") }
  let(:admin_customer) { create(:customer, account_type: account_type, current_balance: 1_000_000.00, status: 0) }
  let(:admin_card) { create(:card, status: 0, customer: admin_customer) }
  let(:admin_sender) { create(:user_information, user: admin_user, accountable: admin_customer) }
  let(:scheduled_job) { described_class.new.perform } # define in the top of your rspec file

  describe "testing worker" do
    before do
      manager_user_information
      employee_user_information
      admin_card
      admin_sender
    end

    it "EmployeeSalaryWorker jobs are enqueued in the scheduled queue" do
      scheduled_job
      assert_equal "default", described_class.queue
    end

    it "EmployeeSalaryWorker jobs are enqueued and check record insert" do
      scheduled_job
      expect(Salary.count).to eq(2)
      expect(Particular.count).to eq(2)
    end
    it "Current balance update" do
      scheduled_job
      customer_employee.reload
      customer_manager.reload
      expect(customer_employee.current_balance).to eq(emplooyee_old_balance + employee.salary_amount)
      expect(customer_manager.current_balance).to eq(manager_old_balance + manager_employee.salary_amount)
    end

    it "goes into the jobs array for testing environment" do
      expect do
        described_class.perform_async
      end.to change(described_class.jobs, :size).by(1)
      described_class.new.perform
    end
  end
end
