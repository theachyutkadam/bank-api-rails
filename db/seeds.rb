# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot'

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
admin_customer = FactoryBot.create(:customer, account_type: account_type, current_balance: 1000000.00)
admin_nominee = FactoryBot.create(:nominee, customer:admin_customer)
admin_card = FactoryBot.create(:card, customer: admin_customer)

FactoryBot.create(:address, addressable:admin_customer)
FactoryBot.create(:address, addressable:admin_nominee)
admin_sender = FactoryBot.create(:user_information, user: admin_user, accountable: admin_customer)

10.times do |i|
  # create manager
  user = FactoryBot.create(:user)
  department = Department.take
  manager = FactoryBot.create(:manager, user: user, department: department)
  employee = FactoryBot.create(:employee, manager: manager, department:department)
  employee_address = FactoryBot.create(:address, addressable:employee)
  FactoryBot.create(:user_information, user: user, accountable: employee)
  p "manager created #{i}"
end

90.times do |i|
  # create employee
  user = FactoryBot.create(:user)
  department = Department.take
  manager = Manager.take
  employee = FactoryBot.create(:employee, manager: manager, department:department)
  FactoryBot.create(:address, addressable:employee)
  FactoryBot.create(:user_information, user: user, accountable: employee)
  p "employee created #{i}"
end

1000.times do |i|
  # create customer
  user = FactoryBot.create(:user)
  account_type = AccountType.take
  customer = FactoryBot.create(:customer, account_type: account_type)
  nominee = FactoryBot.create(:nominee, customer:customer)
  customer_address = FactoryBot.create(:address, addressable:customer)
  nominee_address = FactoryBot.create(:address, addressable:nominee)
  FactoryBot.create(:user_information, user: user, accountable: customer)
  FactoryBot.create(:card, customer: customer)
  puts "customer created #{i}"
end

1000.times do |i|
  # create customer transactions
  card = Card.take
  sender = card.customer.user_information
  receiver = UserInformation.take
  particular = FactoryBot.create(:particular, card: card, sender:sender, receiver:receiver)
  puts "customer particular #{i}"
end

100.times do |i|
  # create employee salary transactions
  employee_user_information = Employee.take.user_information

  particular = FactoryBot.create(:particular, card: admin_card, sender: admin_sender, receiver: employee_user_information)
  salary = FactoryBot.create(:salary, particular: particular, employee: employee_user_information.accountable)
  puts "Salary created #{i}"
end

ApplicationRecord.record_count
