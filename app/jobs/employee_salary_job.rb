class EmployeeSalaryJob < ApplicationJob
  queue_as :default
  RUN_EVERY = 1.minute

  def perform(*_args)
    @sender = User.where(is_admin: true).first.user_information
    employees = Employee.where.not(work_status: 'resignate')
    employees.each do |employee|
      check_amount
      create_particular(employee)
    end
  end

  def create_particular(employee)
    particular = Particular.new(amount: employee.salary_amount, card_id: @sender.accountable.cards.first.id,
                                sender_id: @sender.id, receiver_id: employee.user_information.id)
    return particular.errors unless particular.save

    particular.update_current_balance(particular.sender_id, particular.receiver_id, particular.amount)
    create_salary(particular, employee)
    puts "@@@ salary done of #{employee.id} @@@"
  end

  def create_salary(particular, employee)
    salary = Salary.new(status: 'paid', employee_id: employee.id, particular_id: particular.id,
                        amount: particular.amount)
    salary.save
  end

  def check_amount
    admin_customer = @sender.accountable
    admin_customer.update(current_balance: 10_000_000) if admin_customer.current_balance <= 100_000
    @sender.reload
  end
end
