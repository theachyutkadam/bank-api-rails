class EmployeeSalaryWorker
  include Sidekiq::Worker

  def perform(*_args)
    p 'start salary process'
    @sender = User.where(is_admin: true).first.user_information
    employees = Employee.not_resignate
    employees.each do |employee|
      check_amount
      unless Salary.where('extract(month from created_at) = ?', Date.today.month).where(employee_id: employee.id).any?
        create_particular(employee)
      end
    end
  end

  def create_particular(employee)
    particular = Particular.new(amount: employee.salary_amount, card_id: @sender.accountable.cards.first.id,
                                sender_id: @sender.id, receiver_id: employee.user_information.id)
    return particular.errors unless particular.save

    particular.update_current_balance(particular.sender_id, particular.receiver_id, particular.amount)
    create_salary(particular, employee)
    puts "employee salary #{employee.id}"
  end

  def create_salary(particular, employee)
    salary = Salary.new(status: 'paid', employee_id: employee.id, particular_id: particular.id,
                        amount: particular.amount)
    salary.save
  end

  def check_amount
    admin_customer = @sender.accountable
    admin_customer.activate! unless admin_customer.active?
    admin_customer.update(current_balance: 10_000_000) if admin_customer.current_balance <= 100_000
    @sender.reload
  end
end
