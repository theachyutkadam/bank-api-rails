# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot'

100.times do
  FactoryBot.create :customer
  FactoryBot.create :employee
  FactoryBot.create :particular_detail
  FactoryBot.create :salary
  FactoryBot.create :card
  FactoryBot.create :address
  FactoryBot.create :nominee
  FactoryBot.create :user_information
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
puts "#{ParticularDetail.count} = ParticularDetails"
p 'End+++++++++++='
