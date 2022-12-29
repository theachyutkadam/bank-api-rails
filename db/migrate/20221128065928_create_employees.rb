class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :manager, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.string :official_email
      t.string :education, null: false
      t.string :work_status, null: false, default: 'available'
      t.string :designation, null: false
      t.float :salary_amount, default: 0, null: false
      t.date :date_of_joining, null: false

      t.timestamps
    end
  end
end
