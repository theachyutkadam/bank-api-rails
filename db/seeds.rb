# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot'

10.times do
  FactoryBot.create :customer
  FactoryBot.create :employee
  FactoryBot.create :particular_detail
  FactoryBot.create :salary
  FactoryBot.create :card
  FactoryBot.create :particular_detail
end
p 'Start+++++++++++='
puts "#{Address.count} = Addresses"
puts "#{User.count} = Users"
puts "#{Department.count} = Departments"
puts "#{Nominee.count} = Nominees"
puts "#{Customer.count} = Customers"
puts "#{Card.count} = Cards"
puts "#{Particular.count} = Particulars"
puts "#{Manager.count} = Managers"
puts "#{Employee.count} = Employees"
puts "#{Salary.count} = Salaries"
puts "#{AccountType.count} = Account_types"
puts "#{ParticularDetail.count} = Particular_details"
p 'End+++++++++++='
