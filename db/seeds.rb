# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot'

unless User.where(email: "admin@gmail.com").any?
  ['Saving', 'Salary','Current'].each do |title|
    AccountType.create(title: title)
  end

  Department.create([
    { name: "HR" },
    { name: "Finance" },
    { name: "Loan" },
    { name: "Insurance" },
    { name: "Marketing" }
  ])

  admin_user = FactoryBot.create(:user, is_admin: true, email: "admin@gmail.com")
  account_type = AccountType.where(title: "Current").first
  admin_customer = FactoryBot.create(:customer, account_type: account_type, current_balance: 10000000.00)
  admin_nominee = FactoryBot.create(:nominee, customer:admin_customer)
  admin_card = FactoryBot.create(:card, customer: admin_customer, status: 'active')

  FactoryBot.create(:address, addressable:admin_customer)
  FactoryBot.create(:address, addressable:admin_nominee)
  admin_sender = FactoryBot.create(:user_information, user: admin_user, accountable: admin_customer)
end

10.times do |i|
  # create manager
  p "manager created #{i}"
  user = FactoryBot.create(:user)
  department = Department.take
  manager = FactoryBot.create(:manager, user: user, department: department)
  account_type = AccountType.where(title: "Salary").first
  customer = FactoryBot.create(:customer, account_type: account_type)
  FactoryBot.create(:card, customer: customer, status: 'active')
  employee = FactoryBot.create(:employee, manager: manager, department:department, customer: customer)
  employee_address = FactoryBot.create(:address, addressable:employee)
  FactoryBot.create(:user_information, user: user, accountable: employee)
end

90.times do |i|
  # create employee
  user = FactoryBot.create(:user)
  department = Department.take
  manager = Manager.take
  account_type = AccountType.where(title: "Salary").first
  customer = FactoryBot.create(:customer, account_type: account_type)
  FactoryBot.create(:card, customer: customer, status: 'active')
  employee = FactoryBot.create(:employee, manager: manager, department:department, customer: customer)
  FactoryBot.create(:address, addressable:employee)
  FactoryBot.create(:user_information, user: user, accountable: employee)
  p "employee created #{i} Department emp count #{Department.find(department.id).employee_count}"
end

4999.times do |i|
  # create customer
  flag = true
  while flag
    user = FactoryBot.build(:user)
    if user.valid?
      user.save
      flag = false
      break
    else
      flag = true
      p "*******Email already exits error*********"
      p "****************"
      p user
      p "****************"
      p "*******Email already exits error*********"
    end
  end

  # user = FactoryBot.create(:user)
  account_type = AccountType.take
  customer = FactoryBot.create(:customer, account_type: account_type)
  nominee = FactoryBot.create(:nominee, customer:customer)
  customer_address = FactoryBot.create(:address, addressable:customer)
  nominee_address = FactoryBot.create(:address, addressable:nominee)
  FactoryBot.create(:user_information, user: user, accountable: customer)
  FactoryBot.create(:card, customer: customer, status: 'active')
  customer = customer.reload

  puts "customer created #{i} customer card: #{customer.cards.first.status}"
end

10000.times do |i|
  # create customer transactions
  admin_customer = User.find_by(email: "admin@gmail.com").user_information.accountable
  admin_customer.udpate(current_balance: 10000000) if admin_customer.current_balance <= 10000
  card = Card.take
  sender = card.customer.user_information
  receiver = UserInformation.take
  particular = FactoryBot.create(:particular, card: card, sender:sender, receiver:receiver)
  puts "customer particular #{i}"
end

10000.times do |i|
  # create employee salary transactions
  admin_customer = User.find_by(email: "admin@gmail.com").user_information.accountable
  admin_customer.udpate(current_balance: 10000000) if admin_customer.current_balance <= 100000
  employee_user_information = Employee.take.user_information

  particular = FactoryBot.create(:particular, card: admin_card, sender: admin_sender, receiver: employee_user_information)
  salary = FactoryBot.create(:salary, particular: particular, employee: employee_user_information.accountable)
  puts "Salary created #{i}"
end

ApplicationRecord.record_count
