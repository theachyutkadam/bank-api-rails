# bank-api-rails
create a bank API for learning phase.
Added a command for Fastly create a controller and models.
*Create Controllers using following commands*
- rails g controller users index create update show delete
- rails g controller user_informations index create update show delete
- rails g controller employees index create update show delete
- rails g controller customers index create update show delete
- rails g controller managers index create update show delete
- rails g controller departments index create update show delete
- rails g controller particulars index create update show delete
- rails g controller particular_details index create update show delete
- rails g controller addresses index create update show delete
- rails g controller nominees index create update show delete
- rails g controller cards index create update show delete
- rails g controller account_types index create update show delete
- rails g controller salary index create update show delete

*Create Models using following commands*

- rails g model address building street flat_number pin_code description:text addressable_id:integer addressable_type
- rails g model user username password email status:integer deleted_at:datetime is_admin:boolean token
- rails g model account_type title loan_intrest_rate:float saving_intrest_rate:float
- rails g model department name employee_count:integer
- rails g model customer account_type:references account_number:bigint amount_limit:integer current_balance:float
- rails g model nominee first_name middle_name last_name contact gender:integer relation:integer customer:references
- rails g model card title number:bigint expire_date:datetime csv:integer customer:references status:integer is_deleted:boolean pin:integer
- rails g model manager user_information:references department:references designation status:integer
- rails g model employee department:references customer:references manager:references salary_amount:float education date_of_joining:datetime work_status designation official_email

- rails g model user_information first_name middle_name last_name contact gender:integer birth_date:datetime pan_card_number adhaar_card_number is_handicap:boolean handicap_details:text maritial_status:integer user:references accountable_id:integer accountable_type
- rails g model particular card:references sender:references receiver:references amount:float
- rails g model salary employee:references amount:float status:integer particular:references

*Create a specs files using following commands*
- touch spec/requests/account_types_spec.rb
- touch spec/requests/addresses_spec.rb
- touch spec/requests/employees_spec.rb
- touch spec/requests/customers_spec.rb
- touch spec/requests/managers_spec.rb
- touch spec/requests/departments_spec.rb
- touch spec/requests/particulars_spec.rb
- touch spec/requests/particular_details_spec.rb
- touch spec/requests/addresses_spec.rb
- touch spec/requests/nominees_spec.rb
- touch spec/requests/cards_spec.rb
- touch spec/requests/salaries_spec.rb
- touch spec/requests/users_spec.rb
- touch spec/requests/user_informations_spec.rb

*Create a serializer files using following commands*
- rails g serializer address building street flat_number pin_code description addressable_id addressable_type
- rails g serializer user username password email status deleted_at accountable_id accountable_type is_admin
- rails g serializer user_information first_name middle_name last_name contact gender birth_date pan_card_number adhaar_card_number is_handicap handicap_details  maritial_status user
- rails g serializer account_type title loan_intrest_rate saving_intrest_rate
- rails g serializer department name employee_count
- rails g serializer customer account_type account_number amount_limit current_balance
- rails g serializer nominee first_name middle_name last_name contact gender relation customer
- rails g serializer card title number expire_date csv customer status is_deleted pin
- rails g serializer particular card customer debit_amount credit_amount current_balance
- rails g serializer manager user_information department designation status
- rails g serializer employee department manager education date_of_joining work_status designation official_email
- rails g serializer salary employee amount status particular
- rails g serializer particular_details particular sender receiver
