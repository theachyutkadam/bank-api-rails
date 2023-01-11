class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.record_count # added for learn rebase main branch
    puts '***************************************'
    puts "   #{Card.count}            = Card             ="
    puts "   #{User.count}            = User             ="
    puts "   #{Salary.count}          = Salary           ="
    puts "   #{Manager.count}         = Manager          ="
    puts "   #{Nominee.count}         = Nominee          ="
    puts "   #{Address.count}         = Address          ="
    puts "   #{Employee.count}        = Employee         ="
    puts "   #{Customer.count}        = Customer         ="
    puts "   #{Department.count}      = Department       ="
    puts "   #{Particular.count}      = Particular       ="
    puts "   #{AccountType.count}     = Account_type     ="
    puts "   #{UserInformation.count} = User_information ="
    puts '***************************************'
  end
end
