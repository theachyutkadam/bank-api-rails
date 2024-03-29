# frozen_string_literal: true

@counter = 0
def create_admin_user
  unless User.where(email: "admin@gmail.com").any?
    %w[Saving Salary Current].each do |title|
      AccountType.create(title: title)
    end

    Department.create([
                        { name: "HR" },
                        { name: "Loan" },
                        { name: "Finance" },
                        { name: "Marketing" },
                        { name: "Services" }
                      ])

    admin_user = FactoryBot.create(:user, is_admin: true, username: "admin", email: "admin@gmail.com", status: :active)
    account_type = AccountType.where(title: "Current").first
    admin_customer = create_customer_with_nominee(account_type)
    admin_nominee = admin_customer.nominee

    create_address(admin_customer)
    create_address(admin_nominee)
    create_user_information(admin_user, admin_customer, admin_customer)
    Card.first.update(status: 0)
  end
  create_manager # create manager
end

def create_manager
  10.times do |i|
    user = create_user
    department = Department.all.shuffle.sample
    manager = FactoryBot.create(:manager, user: user, department: department)

    create_employee_information(user, department, manager)
    Rails.logger.debug "manager created #{i}"
  end
  create_employee # create employees
end

def create_employee
  40.times do |i|
    department = Department.all.shuffle.sample
    manager = Manager.all.shuffle.sample
    user = create_user

    create_employee_information(user, department, manager)
    Rails.logger.debug "employee created #{i} Department emp count #{Department.find(department.id).employee_count}"
  end
  create_customer # create customers
end

def create_customer
  2450.times do |i|
    customer = create_customer_with_nominee(nil)
    nominee = customer.nominee

    user = create_user
    create_address(customer)
    create_address(nominee)
    create_user_information(user, customer, customer)
    Rails.logger.debug "customer created #{i} customer card: #{customer.cards.first.status}"
  end
  customer_transactions # create customer transactions
end

def customer_transactions
  2000.times do |i|
    card = Card.active.shuffle.sample
    sender = card.user_information
    receiver = UserInformation.all.shuffle.sample
    FactoryBot.create(:particular, card: card, sender: sender, receiver: receiver)
    Rails.logger.debug "customer particular #{i} #{card.id}"
  end
  employee_salary_transaction # create employee salary transactions
end

def employee_salary_transaction
  activate_admin_card
  1000.times do |i|
    employee_user_information = Employee.all.shuffle.sample.user_information

    particular = FactoryBot.create(:particular, card: admin_card, sender: admin_user_information,
                                                receiver: employee_user_information)
    FactoryBot.create(:salary, particular: particular, employee: employee_user_information.accountable)
    Rails.logger.debug "Salary created #{i}"
  end
  Rails.logger.debug "^^^^^^^^Total #{@counter} User creation field^^^^^^^^"
end

def create_user
  user = FactoryBot.build(:user)
  user.save if user.valid?

  return User.find_by(email: user.email) if user.save

  Rails.logger.debug "@@@@@@User error - #{user.errors.each { |error| Rails.logger.debug error.messages }}@@@@@@"
  @counter += 1
  create_user
end

def create_customer_with_nominee(account_type)
  account_type = AccountType.all.shuffle.sample
  account_type = account_type if account_type
  customer = FactoryBot.create(:customer, account_type: account_type)
  FactoryBot.create(:nominee, customer: customer)
  customer
end

def create_employee_information(user, department, manager)
  account_type = AccountType.where(title: "Salary").first
  customer = create_customer_with_nominee(account_type)
  employee = FactoryBot.create(:employee, manager: manager, department: department, customer: customer)

  create_address(employee)
  create_user_information(user, employee, customer)
end

def create_user_information(user, accountable, customer)
  user_information = FactoryBot.build(:user_information, user: user, accountable: accountable)
  card = FactoryBot.build(:card, customer: customer)

  if user_information.valid? && card.valid?
    user_information.save
    card.save
  else
    if user_information.errors
      Rails.logger.debug "@@@@@@UserInformation Error - #{user_information.errors.each do |_error|
                                                            Rails.logger.debug errormessages
                                                          end}@@@@@@"
    end
    if card.errors
      Rails.logger.debug "@@@@@@Card Error - #{card.errors.each do |_error|
                                                 Rails.logger.debug errormessages
                                               end}@@@@@@"
    end
    create_user_information(user, accountable, customer)
  end
end

def create_address(addressable)
  FactoryBot.create(:address, addressable: addressable)
end

def set_admin_current_balance
  admin_customer = admin_accountable
  admin_customer.update(status: :active) unless admin_customer.active?
  admin_customer.update(current_balance: Employee.sum(:salary_amount)) if admin_customer.current_balance <= 100_000
  admin_customer.reload
end

def admin_user_information
  User.find_by(email: "admin@gmail.com").user_information
end

def admin_accountable
  admin_user_information.accountable
end

def activate_admin_card
  set_admin_current_balance
  card = admin_card
  return if card.active?

  card.active!
  card.reload
end

def admin_card
  admin_accountable.cards.first
end
