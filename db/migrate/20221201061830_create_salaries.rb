# frozen_string_literal: true

class CreateSalaries < ActiveRecord::Migration[7.0]
  def change
    create_table :salaries, id: :uuid do |t|
      t.references :employee, type: :uuid, null: false, foreign_key: true
      t.float :amount, null: false
      t.integer :status, null: false
      t.text :description, null: true
      t.references :particular, type: :uuid, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
