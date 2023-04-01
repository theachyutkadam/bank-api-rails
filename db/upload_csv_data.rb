# frozen_string_literal: true

require "csv"

def start_csv_uploading
  uploading_user
end
# def array_of_records
# records = []
# CSV.read("db/csv_files/demo.csv").each do |record|
# CSV.foreach('db/csv_files/demo.csv', headers: true)  do |record|
# CSV.foreach('db/csv_files/managers.csv', headers: true)  do |record|
#   puts "++++++++++++++++"
#   puts record.to_h
#   puts "++++++++++++++++"
#   # records << extract_(record)
# end
# records
# end
# counter = 0
# CSV.foreach("db/csv_files/addresses.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish addresses.csv file"

# counter = 0
# CSV.foreach("db/csv_files/cards.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish cards.csv file"

# counter = 0
# CSV.foreach("db/csv_files/customers.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish customers.csv file"

# counter = 0
# CSV.foreach("db/csv_files/employees.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish employees.csv file"

# counter = 0
# CSV.foreach("db/csv_files/managers.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish managers.csv file"

# counter = 0
# CSV.foreach("db/csv_files/nominees.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish nominees.csv file"

# counter = 0
# CSV.foreach("db/csv_files/particulars.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish particulars.csv file"

# counter = 0
# CSV.foreach("db/csv_files/salaries.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish salaries.csv file"

# counter = 0
# CSV.foreach("db/csv_files/user_informations.csv", headers: true)  do |record|
#   puts record.to_h
#   puts "#############{counter += 1}"
# end
# puts "Finish user_informations.csv file"

def uploading_user
  counter = 0
  CSV.foreach("db/csv_files/users.csv", headers: true) do |row|
    break if counter == 10

    user = User.new(
      username: row[1],
      password: row[2],
      email: row[3],
      token: row[4],
      status: row[5].to_i,
      is_admin: row[6],
      active_at: row[7],
      inactive_at: row[8],
      blocked_at: row[9],
      created_at: row[10],
      updated_at: row[11],
      deleted_at: row[12],
    )
    is_valid_object(user)
    counter += 1
  end
  Rails.logger.debug "Finish users.csv file"
end

def is_valid_object(object)
  Rails.logger.debug "++++++++++"
  return object.save if object.valid?

  Rails.logger.debug object.errors.messages
  false
end
