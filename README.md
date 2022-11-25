# bank-api-rails
create a bank API for learning phase.
Added a command for Fastly create a controller and models.

rails g controller users index new create update show delete
rails g controller employees index new create update show delete
rails g controller customers index new create update show delete
rails g controller managers index new create update show delete
rails g controller departments index new create update show delete
rails g controller transactions index new create update show delete
rails g controller transaction_users index new create update show delete
rails g controller addresses index new create update show delete
rails g controller nominees index new create update show delete
rails g controller cards index new create update show delete
rails g controller account_types index new create update show delete
rails g controller salary index new create update show delete

rails g model user username password email first_name middle_name last_name contact gender:integer is_active:boolean is_deleted:boolean accountable_id:integer accountable_type pan_card adhaar_card is_handicap:boolean handicap_details:text maritial_status:integer address:references

rails g model address building flat_number road taluka district state
rails g model account_type title loan_intrest_rate:float saving_intrest_rate:float
rails g model department name employee_count:integer
rails g model employee  department:references manager:references education date_of_joining:datetime work_status designation official_email address:references

rails g model customer nominee:references account_type:references account_number:bigint transaction_limit:integer address:references current_balance:float
rails g model manager employee:references department:references designation is_active:boolean
rails g model card title number:bigint expire_date:datetime csv:integer customer:references is_active:boolean is_deleted:boolean pin:integer
rails g model transaction card:references customer:references debit_amount:float credit_amount:float
rails g model transaction_user transaction:references sender:references receiver:references
rails g model nominee first_name middle_name last_name contact gender:integer relation:integer address:references
rails g model salary employee:references amount:float status:integer transaction:references
