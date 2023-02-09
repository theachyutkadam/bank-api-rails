# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: :uuid do |t|
      t.references :manager, type: :uuid, null: false, foreign_key: true
      t.references :customer, type: :uuid, null: false, foreign_key: true
      t.references :department, type: :uuid, null: false, foreign_key: true
      t.string :official_email
      t.string :education, null: false
      t.integer :work_status, null: false, default: 0
      t.string :designation, null: false
      t.float :salary_amount, default: 0, null: false
      t.date :date_of_joining, null: false
      t.datetime :active_at
      t.datetime :available_at
      t.datetime :resignate_at

      t.timestamps
    end
  end
end
