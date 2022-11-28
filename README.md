# bank-api-rails
create a bank API for learning phase.
Added a command for Fastly create a controller and models.
*Create Controllers using following commands*
- rails g controller users index new create update show delete
- rails g controller employees index new create update show delete
- rails g controller customers index new create update show delete
- rails g controller managers index new create update show delete
- rails g controller departments index new create update show delete
- rails g controller particulars index new create update show delete
- rails g controller particular_users index new create update show delete
- rails g controller addresses index new create update show delete
- rails g controller nominees index new create update show delete
- rails g controller cards index new create update show delete
- rails g controller account_types index new create update show delete
- rails g controller salary index new create update show delete

*Create Models using following commands*

- rails g model address building street flat_number pin_code description:text
- rails g model user username password email first_name middle_name last_name contact gender:integer birth_date:datetime is_active:boolean is_deleted:boolean accountable_id:integer accountable_type pan_card_number adhaar_card_number is_handicap:boolean handicap_details:text maritial_status:integer address:references

- rails g model account_type title loan_intrest_rate:float saving_intrest_rate:float
- rails g model department name employee_count:integer
- rails g model nominee first_name middle_name last_name contact gender:integer relation:integer address:references
- rails g model customer nominee:references account_type:references account_number:bigint amount_limit:integer address:references current_balance:float
- rails g model card title number:bigint expire_date:datetime csv:integer customer:references is_active:boolean is_deleted:boolean pin:integer
- rails g model particular card:references customer:references debit_amount:float credit_amount:float current_balance:float

- rails g model manager user:references department:references designation is_active:boolean
- rails g model employee department:references manager:references education date_of_joining:datetime work_status designation official_email address:references
- rails g model salary employee:references amount:float status:integer particular:references

- rails g model particular_details particular:references sender:references receiver:references
