# frozen_string_literal: true

namespace :employee_salary do
  desc "Send the employee monthly salary"
  task start_process: :environment do
    p "@@@@@@@@@@@@ start rake task..."
    EmployeeSalaryJob.perform_now
  end
end
