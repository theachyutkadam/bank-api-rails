# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # added for learn rebase main branch
  def self.record_count
    Rails.logger.debug "***************************************"
    Rails.logger.debug "---Card             = #{Card.count}            "
    Rails.logger.debug "---User             = #{User.count}            "
    Rails.logger.debug "---Salary           = #{Salary.count}          "
    Rails.logger.debug "---Manager          = #{Manager.count}         "
    Rails.logger.debug "---Nominee          = #{Nominee.count}         "
    Rails.logger.debug "---Address          = #{Address.count}         "
    Rails.logger.debug "---Employee         = #{Employee.count}        "
    Rails.logger.debug "---Customer         = #{Customer.count}        "
    Rails.logger.debug "---Department       = #{Department.count}      "
    Rails.logger.debug "---Particular       = #{Particular.count}      "
    Rails.logger.debug "---Account_type     = #{AccountType.count}     "
    Rails.logger.debug "---User_information = #{UserInformation.count} "
    Rails.logger.debug "***************************************"
  end
end
