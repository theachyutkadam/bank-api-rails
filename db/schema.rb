# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_28_063759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "title"
    t.float "loan_intrest_rate"
    t.float "saving_intrest_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "building"
    t.string "flat_number"
    t.string "road"
    t.string "taluka"
    t.string "district"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.bigint "number"
    t.datetime "expire_date"
    t.integer "csv"
    t.bigint "customer_id", null: false
    t.boolean "is_active"
    t.boolean "is_deleted"
    t.integer "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_cards_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "nominee_id", null: false
    t.bigint "account_type_id", null: false
    t.bigint "account_number"
    t.integer "transaction_limit"
    t.bigint "address_id", null: false
    t.float "current_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_type_id"], name: "index_customers_on_account_type_id"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["nominee_id"], name: "index_customers_on_nominee_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "employee_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "manager_id", null: false
    t.string "education"
    t.datetime "date_of_joining"
    t.string "work_status"
    t.string "designation"
    t.string "official_email"
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_employees_on_address_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
  end

  create_table "managers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "department_id", null: false
    t.string "designation"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_managers_on_department_id"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "nominees", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "contact"
    t.integer "gender"
    t.integer "relation"
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_nominees_on_address_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.float "amount"
    t.integer "status"
    t.bigint "transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_salaries_on_employee_id"
    t.index ["transaction_id"], name: "index_salaries_on_transaction_id"
  end

  create_table "transaction_details", force: :cascade do |t|
    t.bigint "transaction_id", null: false
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_transaction_details_on_receiver_id"
    t.index ["sender_id"], name: "index_transaction_details_on_sender_id"
    t.index ["transaction_id"], name: "index_transaction_details_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "customer_id", null: false
    t.float "debit_amount"
    t.float "credit_amount"
    t.float "current_balance"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_transactions_on_card_id"
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "contact"
    t.integer "gender"
    t.boolean "is_active"
    t.boolean "is_deleted"
    t.integer "accountable_id"
    t.string "accountable_type"
    t.string "pan_card"
    t.string "adhaar_card"
    t.boolean "is_handicap"
    t.text "handicap_details"
    t.integer "maritial_status"
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
  end

  add_foreign_key "cards", "customers"
  add_foreign_key "customers", "account_types"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "nominees"
  add_foreign_key "employees", "addresses"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "managers"
  add_foreign_key "managers", "departments"
  add_foreign_key "managers", "users"
  add_foreign_key "nominees", "addresses"
  add_foreign_key "salaries", "employees"
  add_foreign_key "salaries", "transactions"
  add_foreign_key "transaction_details", "customers", column: "receiver_id"
  add_foreign_key "transaction_details", "customers", column: "sender_id"
  add_foreign_key "transaction_details", "transactions"
  add_foreign_key "transactions", "cards"
  add_foreign_key "transactions", "customers"
  add_foreign_key "users", "addresses"
end
