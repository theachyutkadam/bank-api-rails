class EmployeeSalaryJob < ApplicationJob
  queue_as :default
  RUN_EVERY = 1.minute

  def perform(*args)
    @sender = User.where(is_admin: true).first.user_information
    employees = Employee.where.not(work_status: "resignate")
    employees.each do |employee|
      create_particular(employee)
    end
  end

  def create_particular employee
    particular = Particular.new(amount: employee.salary_amount, card_id: @sender.accountable.cards.first.id, sender_id: @sender.id, receiver_id: employee.user_information.id)
    if particular.save
      particular.update_current_balance(particular.sender_id, particular.receiver_id, particular.amount)
      create_salary(particular, employee)
    end
    return particular.errors
  end

  def create_salary(particular, employee)
    salary = Salary.new(status: 'paid', employee_id: employee.id, particular_id: particular.id, amount: particular.amount)
    return salary.save
    p salary.errors
  end
end
