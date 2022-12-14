# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot'

admin_user = FactoryBot.create(:user, is_admin: true, email: "admin@gmail.com")

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
puts "@@@@@@@@@@@@@@@@@@@"
p "create manager"

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
puts "@@@@@@@@@@@@@@@@@@@"
p "create employee"

100.times do |i|
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
puts "@@@@@@@@@@@@@@@@@@@"
p "create customer"

1000.times do |i|
  # create customer transactions
  card = Card.take
  sender = card.customer.user_information
  receiver = UserInformation.take
  particular = FactoryBot.create(:particular, card: card, sender:sender, receiver:receiver)
  puts "particular #{i}"
end
puts "@@@@@@@@@@@@@@@@@@@"
p "create customer transactions"

1000.times do |i|
  # create employee salary transactions
  account_type = AccountType.where(title: "Current").first
  customer = FactoryBot.create(:customer, account_type: account_type, current_balance: 1000000.00)
  nominee = FactoryBot.create(:nominee, customer:customer)
  card = FactoryBot.create(:card, customer: customer)
  
  FactoryBot.create(:address, addressable:customer)
  FactoryBot.create(:address, addressable:nominee)

  sender = FactoryBot.create(:user_information, user: admin_user, accountable: customer)  
  receiver = Employee.take.user_information

  particular = FactoryBot.create(:particular, card: card, sender:sender, receiver:receiver)
  puts "Salary created #{i}"
end


p 'Start+++++++++++='
puts "#{User.count} = Users"
puts "#{Card.count} = Cards"
puts "#{Salary.count} = Salaries"
puts "#{Manager.count} = Managers"
puts "#{Nominee.count} = Nominees"
puts "#{Address.count} = Addresses"
puts "#{Customer.count} = Customers"
puts "#{Employee.count} = Employees"
puts "#{Department.count} = Departments"
puts "#{Particular.count} = Particulars"
puts "#{AccountType.count} = AccountTypes"
puts "#{UserInformation.count} = UserInformation"
p 'End+++++++++++='
