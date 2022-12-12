class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :department, null: false, foreign_key: true
      t.references :manager, null: false, foreign_key: true
      t.string :education
      t.datetime :date_of_joining
      t.string :work_status
      t.string :designation
      t.string :official_email

      t.timestamps
    end
  end
end
