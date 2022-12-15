class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :department, null: false, foreign_key: true
      t.references :manager, null: false, foreign_key: true
      t.string :education, null: false
      t.datetime :date_of_joining, null: false
      t.string :work_status, null: false
      t.string :designation, null: false
      t.string :official_email

      t.timestamps
    end
  end
end
