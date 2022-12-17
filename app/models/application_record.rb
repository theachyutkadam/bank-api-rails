class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.record_count
    puts '***************************************'
    puts "     - Card             = #{Card.count}"
    puts "     - User             = #{User.count}"
    puts "     - Salary           = #{Salary.count}"
    puts "     - Manager          = #{Manager.count}"
    puts "     - Nominee          = #{Nominee.count}"
    puts "     - Address          = #{Address.count}"
    puts "     - Employee         = #{Employee.count}"
    puts "     - Customer         = #{Customer.count}"
    puts "     - Department       = #{Department.count}"
    puts "     - Particular       = #{Particular.count}"
    puts "     - Account_type     = #{AccountType.count}"
    puts "     - User_information = #{UserInformation.count}"
    puts '***************************************'
  end
end
