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

ActiveRecord::Schema[7.0].define(version: 2022_12_01_061830) do
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
    t.string "street"
    t.string "pin_code"
    t.text "description"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "number", null: false
    t.datetime "expire_date", null: false
    t.integer "csv", null: false
    t.bigint "customer_id", null: false
    t.integer "status", null: false
    t.boolean "is_deleted"
    t.integer "pin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_cards_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "account_type_id", null: false
    t.bigint "account_number", null: false
    t.integer "amount_limit", null: false
    t.float "current_balance", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_type_id"], name: "index_customers_on_account_type_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.integer "employee_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "manager_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "department_id", null: false
    t.string "official_email"
    t.string "education", null: false
    t.string "work_status", null: false
    t.string "designation", null: false
    t.float "salary_amount", default: 0.0, null: false
    t.date "date_of_joining", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_employees_on_customer_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
  end

  create_table "managers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "department_id", null: false
    t.string "designation", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_managers_on_department_id"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "nominees", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.string "contact", null: false
    t.integer "gender", null: false
    t.integer "relation", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_nominees_on_customer_id"
  end

  create_table "particulars", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.float "amount", null: false
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_particulars_on_card_id"
    t.index ["receiver_id"], name: "index_particulars_on_receiver_id"
    t.index ["sender_id"], name: "index_particulars_on_sender_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.float "amount", null: false
    t.integer "status", null: false
    t.bigint "particular_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_salaries_on_employee_id"
    t.index ["particular_id"], name: "index_salaries_on_particular_id"
  end

  create_table "user_informations", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.string "contact", null: false
    t.integer "gender", null: false
    t.date "birth_date", null: false
    t.string "pan_card_number", null: false
    t.string "adhaar_card_number", null: false
    t.boolean "is_handicap"
    t.text "handicap_details"
    t.integer "maritial_status", null: false
    t.bigint "user_id", null: false
    t.integer "accountable_id"
    t.string "accountable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_informations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.string "email", null: false
    t.string "token"
    t.integer "status", null: false
    t.boolean "is_admin", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "customers"
  add_foreign_key "customers", "account_types"
  add_foreign_key "employees", "customers"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "managers"
  add_foreign_key "managers", "departments"
  add_foreign_key "managers", "users"
  add_foreign_key "nominees", "customers"
  add_foreign_key "particulars", "cards"
  add_foreign_key "particulars", "user_informations", column: "receiver_id"
  add_foreign_key "particulars", "user_informations", column: "sender_id"
  add_foreign_key "salaries", "employees"
  add_foreign_key "salaries", "particulars"
  add_foreign_key "user_informations", "users"
end
